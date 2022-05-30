//
//  AirtableManager.swift
//  KOFFII 3.0
//
//  Created by Ümit Gül on 21.03.22.
//

import Foundation
import AirtableKit
import Combine

class AirtableManager {

    private var airtable: Airtable

    /// The Airtable Record
    private var record: AirtableKit.Record? = nil

    /// The subscriptions of this view
    private var subscriptions: Set<AnyCancellable> = []

    init() {
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
        let baseID = Bundle.main.object(forInfoDictionaryKey: "API_BASE_ID") as? String

        guard let key = apiKey, !key.isEmpty, let base = baseID, !base.isEmpty else {
            print("API key does not exist")
            airtable = Airtable(baseID: "base", apiKey: "key")
            return
        }

        airtable = Airtable(baseID: base, apiKey: key)
    }

    /// A publisher that lists the items from Airtable
    var coffeePlaceslistFromAirtablePublisher: AnyPublisher<AirtableKit.Record, AirtableError> {
        airtable
            .list(tableName: "CoffeePlaces")
            .receive(on: DispatchQueue.main)
            .compactMap(\.first)
            .eraseToAnyPublisher()
    }

    /// Loads the items stored in Airtable
    func loadItems() {
        self.coffeePlaceslistFromAirtablePublisher
            .replaceError(with: .init(fields: [:]))
            .sink(receiveValue: update(with:))
            .store(in: &subscriptions)
    }

    /// Updates local state using the provided Record
    /// - Parameter record: The record from which to get the data
    func update(with record: AirtableKit.Record) {
        self.record = record
        print(record)
    }

}
