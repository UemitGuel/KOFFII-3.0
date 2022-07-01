import Foundation
import AirtableKit
import Combine

class InformationController: ObservableObject {

    private var airtable: Airtable
    private var subscriptions: Set<AnyCancellable> = []

    @Published var allInformation: [Information] = []
    @Published var randomElement: Information?

    init() {
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

    func selectNewRandomElement() {
        randomElement = allInformation.randomElement() ?? nil
    }
}

extension InformationController {

    /// A publisher that lists the items from Airtable
    var coffeePlaceslistFromAirtablePublisher: AnyPublisher<[AirtableKit.Record], AirtableError> {
        airtable
            .list(tableName: "Preparation")
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
            let model = Information(record: rec)
            allInformation.append(model)
            print(model)
        }
        randomElement = allInformation.randomElement() ?? nil
    }
}
