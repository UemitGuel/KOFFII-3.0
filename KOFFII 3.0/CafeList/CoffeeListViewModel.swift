//
//  CafeViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 18.04.21.
//

import Foundation

class CoffeeListViewModel: ObservableObject {
        
    @Published var coffeeList: [Coffee] = []
    
    @Published var needWifi = false
    @Published var needFood = false
    @Published var needVegan = false
    @Published var needPlug = false
    
    @Published var includeRosteries = true
    
    init() {
        self.coffeeList = coffeeData
        filterCoffeeList()
    }
    
    func filterCoffeeList() {
        var coffee = coffeeData
        if needWifi {
            coffee = coffee.filter { $0.hasWifi }
        }
        if needFood {
            coffee = coffee.filter { $0.hasFood }
        }
        if needVegan {
            coffee = coffee.filter { $0.hasVegan }
        }
        if needPlug {
            coffee = coffee.filter { $0.hasPlug }
        }
        if !includeRosteries {
            coffee = coffee.filter { $0.isRoastery == false }
        }
        //TODO
//        coffee.sort { LocationStore.shared.getDistance(cafeLocation: $0.location) < LocationStore.shared.getDistance(cafeLocation: $1.location) }
        self.coffeeList = coffee
    }
}
