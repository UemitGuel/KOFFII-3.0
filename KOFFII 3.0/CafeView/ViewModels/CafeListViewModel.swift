//
//  CafeViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 18.04.21.
//

import Foundation

class CafeListViewModel: ObservableObject {
        
    @Published var cafeList: [Cafe] = []
    
    @Published var needWifi = false
    @Published var needFood = false
    @Published var needVegan = false
    @Published var needPlug = false
    
    init() {
        self.cafeList = coffeeData
        filterCafeList()
    }
    
    func filterCafeList() {
        var cafeList = coffeeData
        if needWifi {
            cafeList = cafeList.filter { $0.hasWifi }
        }
        if needFood {
            cafeList = cafeList.filter { $0.hasFood }
        }
        if needVegan {
            cafeList = cafeList.filter { $0.hasVegan }
        }
        if needPlug {
            cafeList = cafeList.filter { $0.hasPlug }
        }
        cafeList.sort { LocationStore.shared.getDistance(cafeLocation: $0.location) < LocationStore.shared.getDistance(cafeLocation: $1.location) }
        self.cafeList = cafeList.sorted()
    }
    
}
