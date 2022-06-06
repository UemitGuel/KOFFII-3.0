//
//  CafeViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 18.04.21.
//

import Foundation
import AirtableKit
import Combine

class CoffeeListViewModel: ObservableObject {
        
    @Published var coffeeList: [Coffee] = []
    @Published var newCoffeeList: [NewCoffeeModel] = []
    private var airtable: Airtable
    private var subscriptions: Set<AnyCancellable> = []

    @Published var needWifi = false
    @Published var needFood = false
    @Published var needVegan = false
    @Published var needPlug = false
    
    @Published var includeRosteries = true

    init() {
        self.coffeeList = coffeeData

        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
        let baseID = Bundle.main.object(forInfoDictionaryKey: "API_BASE_ID") as? String

        guard let key = apiKey, !key.isEmpty, let base = baseID, !base.isEmpty else {
            print("API key does not exist")
            airtable = Airtable(baseID: "base", apiKey: "key")
            return
        }

        airtable = Airtable(baseID: base, apiKey: key)
        loadItems()
    }
    
//    func filterCoffeeList() {
//        var coffee = coffeeData
//        if needWifi {
//            coffee = coffee.filter { $0.hasWifi }
//        }
//        if needFood {
//            coffee = coffee.filter { $0.hasFood }
//        }
//        if needVegan {
//            coffee = coffee.filter { $0.hasVegan }
//        }
//        if needPlug {
//            coffee = coffee.filter { $0.hasPlug }
//        }
//        if !includeRosteries {
//            coffee = coffee.filter { $0.isRoastery == false }
//        }
//        //TODO
////        coffee.sort { LocationStore.shared.getDistance(cafeLocation: $0.location) < LocationStore.shared.getDistance(cafeLocation: $1.location) }
//        self.coffeeList = coffee
//    }
}

extension CoffeeListViewModel {

    /// A publisher that lists the items from Airtable
    var coffeePlaceslistFromAirtablePublisher: AnyPublisher<[AirtableKit.Record], AirtableError> {
        airtable
            .list(tableName: "CoffeePlaces")
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    /// Loads the items stored in Airtable
    func loadItems() {
        self.coffeePlaceslistFromAirtablePublisher
            .replaceError(with: [])
            .sink(receiveValue: update(with:))
            .store(in: &subscriptions)
    }

    /// Update the viewModel
    func update(with record: [AirtableKit.Record]) {
        for rec in record {
            let model = NewCoffeeModel(record: rec)
            newCoffeeList.append(model)
            print(model)
        }
     }
}
