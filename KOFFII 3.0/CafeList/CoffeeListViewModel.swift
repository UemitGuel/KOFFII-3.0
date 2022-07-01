import Foundation
import AirtableKit
import Combine

class CoffeeListViewModel: ObservableObject {

    private var airtable: Airtable
    private var subscriptions: Set<AnyCancellable> = []
    var allCoffeeList: [CoffeeModel] = []

    @Published var filteredCoffeeList: [CoffeeModel] = []
    var newCoffeeListSpotlight: [CoffeeModel] {
        return filteredCoffeeList.filter { $0.inSpotlight ?? false }
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
            let model = CoffeeModel(record: rec)
            allCoffeeList.append(model)
            print(model)
        }
        filteredCoffeeList = allCoffeeList
    }
}
