//
//  WeatherCombine.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 12.05.21.
//

import Foundation
import Combine

class WeatherStore: ObservableObject {
    
    @Published var model: WeatherModel = WeatherModel(conditionId: 0, temperature: 273.15)
    let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Cologne&appid=d65a294fa426ac1d4632fac8ca526ec")!
    var cancellables: Set<AnyCancellable> = []
    
    enum Error: Swift.Error, CustomStringConvertible {
        case network
        case parsing
        case unknown
        
        var description: String {
            switch self {
            case .network:
               return "Ein Netzwerkfehler ist aufgetretten."
            case .parsing:
              return "Netzwerkanfrage konnte nicht korrekt verarbeitet werden."
            case .unknown:
              return "Ein unbekannter Fehler ist aufgetreten"
            }
        }
        
        init(_ error: Swift.Error) {
            switch error {
            case is URLError:
                self = .network
            case is DecodingError:
                self = .parsing
            default:
                self = error as? WeatherStore.Error ?? .unknown
            }
        }
    }
    
    init() {
        URLSession.shared.dataTaskPublisher(for: weatherURL)
            .tryMap { result in
                guard let response = result.response as? HTTPURLResponse else {
                    throw WeatherStore.Error.network
                }
                guard (200..<300).contains(response.statusCode) else {
                    throw WeatherStore.Error.network
                }
                return result.data
            }
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .mapError(WeatherStore.Error.init)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { weatherData in
                print(weatherData)
                let conditionID = weatherData.weather[0].id
                let temp = weatherData.main.temp
                self.model = WeatherModel(conditionId: conditionID, temperature: temp)
            })
            .store(in: &cancellables)
    }
}
