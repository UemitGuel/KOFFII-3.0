//
//  WeatherModel.swift
//  Clima
//
//  Created by Angela Yu on 03/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let temperature: Double
    
    var temperatureString: String {
        return "\(String(format: "%.1f", temperature - 273.15))°"
    }
    
    var conditionName: String {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour > 21 || hour < 6 {
            return "moon"
        } else {
            switch conditionId {
            case 200...232:
                return "cloud.bolt"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud.bolt"
            default:
                return "cloud"
            }
        }
    }
    
}
