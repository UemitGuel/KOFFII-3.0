import Foundation
import AirtableKit
import Combine

class CoffeeListViewModel: ObservableObject {

    private var airtable: Airtable
    private var subscriptions: Set<AnyCancellable> = []
    var allCoffeeList: [CoffeeModel] = []

    @Published var filteredCoffeeList: [CoffeeModel] = []
    @Published var error: String? = nil

    var newCoffeeListSpotlight: [CoffeeModel] {
        return allCoffeeList.filter { $0.inSpotlight ?? false }
    }

    @Published var requestedFeatures: [RequestedFeature] = [
        RequestedFeature(feature: .wifi),
        RequestedFeature(feature: .food),
        RequestedFeature(feature: .vegan),
        RequestedFeature(feature: .plugin),
    ]

    class RequestedFeature: Featureable {
        var feature: Feature
        var isUserRequested: Bool = false

        init(feature: Feature) {
            self.feature = feature
        }
    }

    @Published var includeRosteries = true

    init() {
        // Use the correct Base ID instead of the table ID
        airtable = Airtable(baseID: Constants.APIKeys.airtableBaseID, apiKey: Constants.APIKeys.airtableAPIKey)
        print("Initializing Airtable with baseID: \(Constants.APIKeys.airtableBaseID)")
        print("Table ID that will be used: \(Constants.APIKeys.airtableCoffeeTableKey)")
        loadItems()
    }

    func filterCoffeeList() {
        var coffee = allCoffeeList
        for feature in requestedFeatures where feature.isUserRequested {
            coffee = coffee.filter { $0.features[feature.feature.rawValue].isAvailable }
        }
        //        if !includeRosteries {
        //            coffee = coffee.filter { $0.isRoastery == false }
        //        }
        //TODO
//        coffee.sort { LocationStore.shared.getDistance(cafeLocation: $0.location) < LocationStore.shared.getDistance(cafeLocation: $1.location) }
        self.filteredCoffeeList = coffee
    }
}

extension CoffeeListViewModel {

    /// A publisher that lists the items from Airtable
    var coffeePlaceslistFromAirtablePublisher: AnyPublisher<[AirtableKit.Record], AirtableError> {
        // Use the correct table ID constant
        airtable
            .list(tableName: Constants.APIKeys.airtableCoffeeTableKey)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    /// Loads the items stored in Airtable
    func loadItems() {
        self.coffeePlaceslistFromAirtablePublisher
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        print("Airtable request completed successfully")
                    case .failure(let error):
                        print("Airtable error: \(error.localizedDescription)")
                        self?.error = "Failed to load data: \(error.localizedDescription)"
                    }
                },
                receiveValue: { [weak self] records in
                    print("Received \(records.count) records from Airtable")
                    self?.update(with: records)
                }
            )
            .store(in: &subscriptions)
    }

    /// Update the viewModel
    func update(with records: [AirtableKit.Record]) {
        allCoffeeList.removeAll()

        if records.isEmpty {
            print("Warning: No records received from Airtable")
        }

        for rec in records {
            let model = CoffeeModel(record: rec)
            allCoffeeList.append(model)
            print("Added record: \(model.name ?? "Unnamed")")
        }

        print("Total records processed: \(allCoffeeList.count)")
        filteredCoffeeList = allCoffeeList
    }
}
