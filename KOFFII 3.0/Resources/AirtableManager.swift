//
//  AirtableManager.swift
//  KOFFII 3.0
//
//  Created by Ümit Gül on 21.03.22.
//

import Foundation
import AirtableKit
import Combine

//class AirtableManager {
//
//    private var airtable: Airtable
//
//    /// The Airtable Record
//    private var record: AirtableKit.Record? = nil
//
//    /// The subscriptions of this view
//    private var subscriptions: Set<AnyCancellable> = []
//
//    init(apiBaseId: String, apiKey: String) {
//        airtable = Airtable(baseID: apiBaseId, apiKey: apiKey)
//    }
//
//    /// A publisher that lists the items from Airtable
//    var coffeePlaceslistFromAirtablePublisher: AnyPublisher<AirtableKit.Record, AirtableError> {
//        airtable
//            .list(tableName: "CoffeePlaces")
//            .receive(on: DispatchQueue.main)
//            .compactMap(\.first)
//            .eraseToAnyPublisher()
//    }
//
//    /// Loads the items stored in Airtable
//    func loadItems() {
//        self.coffeePlaceslistFromAirtablePublisher
//            .mapError({ e in
//                <#code#>
//            })
//            .map {
//                let coffee = CoffeeAirtable()
//                coffee.name = $0.field["name"]
//            }
//            .sink(receiveValue:  {print($0)})
//    }
//
//    /// Updates local state using the provided Record
//    /// - Parameter record: The record from which to get the data
//    func update(with record: AirtableKit.Record) {
//        self.record = record
//        print(record)
//    }
//
//}
