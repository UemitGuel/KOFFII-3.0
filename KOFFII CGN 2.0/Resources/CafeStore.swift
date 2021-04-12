//
//  CafeStore.swift
//  KOFFII CGN 2.0
//
//  Created by Gül, Ümit on 08.01.21.
//

import Foundation
import Combine

class CafeStore: ObservableObject {
    @Published var cafes: [Cafe] = load("cafeData.json")
    
    @Published var needWifi = false
    @Published var needFood = false
    @Published var needVegan = false
    @Published var needPlug = false
    
    private var isFiltering: Bool {
        if needWifi || needFood || needVegan || needPlug {
            return true
        } else {
            return false
        }
    }
    
    @Published var filteredCafes: [Cafe] = [] 
    
    func getfilteredCafeList() {
        if isFiltering {
            if needWifi {
                filteredCafes = filteredCafes.filter { $0.hasWifi }
            }
            if needFood {
                filteredCafes = filteredCafes.filter { $0.hasFood }
            }
            if needVegan {
                filteredCafes = filteredCafes.filter { $0.hasVegan }
            }
            if needPlug {
                filteredCafes = filteredCafes.filter { $0.hasPlug }
            }
            return filteredCafes
        } else {
            return cafes
        }
    }
}
