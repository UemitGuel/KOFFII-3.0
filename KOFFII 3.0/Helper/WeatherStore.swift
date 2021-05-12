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
    let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Cologne&appid=d65a294fa426ac1d4632fac8ca526ec7")!
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        URLSession.shared.dataTaskPublisher(for: weatherURL)
            .map(\.data)
            .decode(type: WeatherData.self, decoder: JSONDecoder())
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
