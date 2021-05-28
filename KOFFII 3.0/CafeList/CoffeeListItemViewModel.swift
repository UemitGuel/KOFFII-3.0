//
//  CafeViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 18.04.21.
//

import Foundation
import CoreLocation

struct CoffeeListItemViewModel: Identifiable {
    
    let id = UUID()
    let locationStore = LocationStore.shared
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var isRoastery: Bool {
        return self.coffee.isRoastery
    }
    
    var distance: String {
        return self.locationStore.getDistanceAsString(cafeLocation: coffee.location)
    }
    
    var hasWifi: Bool {
        return self.coffee.hasWifi
    }
    var hasFood: Bool {
        return self.coffee.hasFood
    }

    var hasVegan: Bool {
        return self.coffee.hasVegan
    }

    var hasPlug: Bool {
        return self.coffee.hasPlug
    }
    
    var hood: String {
        return self.coffee.hood.rawValue
    }
}
