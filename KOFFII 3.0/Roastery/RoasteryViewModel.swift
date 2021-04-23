//
//  RoasteryViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 23.04.21.
//

import Foundation
import CoreLocation

struct RoasteryViewModel: Identifiable {
    
    let id = UUID()
    let locationStore = LocationStore.shared
    let roastery: Roastery
    
    init(roastery: Roastery) {
        self.roastery = roastery
    }
    
    var name: String {
        return self.roastery.name
    }
    
    var hood: String {
        return self.roastery.hood.rawValue
    }
    
    var location: CLLocation {
        return self.roastery.location
    }
    
    var distance: String {
        return self.locationStore.getDistanceAsString(cafeLocation: location)
    }
    
}
