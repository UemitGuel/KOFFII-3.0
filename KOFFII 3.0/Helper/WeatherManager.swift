//
//  WeatherManager.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 11.05.21.
//

import Foundation
import Combine

class WeatherManager: ObservableObject {
    
    @Published var weather: String = ""
    var subscriptions: Set<AnyCancellable> = []
    let url: URL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Cologne&appid=d65a294fa426ac1d4632fac8ca526ec7")!
    
    init() {
        fetchCologneWeather()
    }
    
    func fetchCologneWeather() {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .map(\.name)
            .replaceError(with: "erroor")
            .assign(to: \.weather, on: self)
            .store(in: &subscriptions)
    }
    
}
