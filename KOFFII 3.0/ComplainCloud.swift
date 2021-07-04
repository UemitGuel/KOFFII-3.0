//
//  PersistenceController.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 30.06.21.
//

import CloudKit

final class ComplainCloud: ObservableObject {
    
    // MARK: - VM State

    enum State {
        case idle
        case loading
        case loaded(complains: [Complain])
        case error(Error)
        
        var isLoading: Bool {
            switch self {
            case .loading:
                return true
            default:
                return false
            }
        }
        
        var isError: Bool {
            switch self {
            case .error:
                return true
            default:
                return false
            }
        }
    }
    
    // MARK: - Properties

    @Published private(set) var state = State.idle
    private lazy var container = CKContainer(identifier: Config.containerIdentifier)
    private lazy var database = container.publicCloudDatabase
    private(set) var complains: [Complain] = []

    
    // MARK: - API
    
    func refresh() {
        self.state = .loading
        
        getComplains() { result in
            switch result {
            case .failure(let error):
                self.state = .error(error)
            case .success(let complains):
                self.state = .loaded(complains: complains)
            }
        }
    }

        func getComplains(completionQueue: DispatchQueue = .main, completionHandler: @escaping (Result<[Complain], Error>) -> Void) {
            let predicate = NSPredicate(value: true)
            let query = CKQuery(recordType: "Complain", predicate: predicate)
            database.perform(query, inZoneWith: CKRecordZone.default().zoneID) {[weak self] results, error in
                guard let self = self else { return }
                if let error = error {
                    DispatchQueue.main.async {
                        completionHandler(.failure(error))
                    }
                    return
                }
                guard let results = results else { return }
                self.complains = results.compactMap {
                    Complain(record: $0)
                }
                DispatchQueue.main.async {
                    completionHandler(.success(self.complains))
                }
            }
        }
//
//    @objc func refresh(_ completion: @escaping (Error?) -> Void) {
//      let predicate = NSPredicate(value: true)
//      let query = CKQuery(recordType: "Establishment", predicate: predicate)
//      establishments(forQuery: query, completion)
//    }

    
//    private func establishments(forQuery query: CKQuery, _ completion: @escaping (Error?) -> Void) {
//      publicDB.perform(query, inZoneWith: CKRecordZone.default().zoneID) { [weak self] results, error in
//        guard let self = self else { return }
//        if let error = error {
//          DispatchQueue.main.async {
//            completion(error)
//          }
//          return
//        }
//        guard let results = results else { return }
//        self.establishments = results.compactMap {
//          Establishment(record: $0, database: self.publicDB)
//        }
//        DispatchQueue.main.async {
//          completion(nil)
//        }
//      }
//    }

    
}
