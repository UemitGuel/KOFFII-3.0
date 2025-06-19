import Foundation
import AirtableKit
import Combine

class InformationController: ObservableObject {

    private var airtable: Airtable
    private var subscriptions: Set<AnyCancellable> = []

    @Published var allInformation: [Information] = []
    @Published var randomElement: Information?

    init() {
        airtable = Airtable(baseID: Constants.APIKeys.airtableBaseID, apiKey: Constants.APIKeys.airtableAPIKey)
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
