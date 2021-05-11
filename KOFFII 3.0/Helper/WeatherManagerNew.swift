//
//  WeatherManagerNew.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 11.05.21.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManagerNew, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManagerNew {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=Cologne&appid=d65a294fa426ac1d4632fac8ca526ec7"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather() {
        performRequest(with: weatherURL)
    }
    
//    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
//        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
//        performRequest(with: urlString)
//    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            print(weather)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}
