//
//  Data.swift
//  KOFFII CGN 2
//
//  Created by Ümit Gül on 20.04.20.
//  Copyright © 2020 Ümit Gül. All rights reserved.
//

import Foundation

let cafeData: [Coffee] = load("cafeData.json")
let roasteryData: [Coffee] = load("RoasteryData.json")
let coffeeData = cafeData + roasteryData
let informationData: [Information] = load("InformationData.json")

let topThreeOfTheMonth: [DiscoveryCafeViewModel] = [DiscoveryCafeViewModel(cafe: cafeData[38]),DiscoveryCafeViewModel(cafe: cafeData[3]),DiscoveryCafeViewModel(cafe: cafeData[48])]

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn´t find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn´t load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
