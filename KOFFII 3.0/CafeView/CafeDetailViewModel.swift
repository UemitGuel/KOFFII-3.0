//
//  CafeDetailViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 19.04.21.
//

import Foundation
import CoreLocation

struct CafeDetailViewModel: Identifiable {
    
    let id = UUID()
    let locationStore = LocationStore.shared
    var cafe: Cafe
    
    init(cafe: Cafe) {
        self.cafe = cafe
    }
    
    var hours: String {
        guard let start = self.cafe.hours?[0].start, let end = self.cafe.hours?[0].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var coordinates: CLLocationCoordinate2D {
        return self.cafe.coordinates
    }
    
    var distance: String {
        return self.locationStore.getDistanceAsString(cafeLocation: location)
    }
    
    var location: CLLocation {
        return self.cafe.location
    }
    
    var locationURL: String {
        return self.cafe.locationURL
    }
    
    var name: String {
        return self.cafe.name
    }
    
    var hasWifi: Bool {
        return self.cafe.hasWifi
    }
    var hasFood: Bool {
        return self.cafe.hasFood
    }
    
    var hasVegan: Bool {
        return self.cafe.hasVegan
    }
    
    var hasPlug: Bool {
        return self.cafe.hasPlug
    }
    
    var hood: String {
        return self.cafe.hood.rawValue
    }
    
    var hasNotes: Bool {
        return !self.cafe.notes.isEmpty
    }
    
    var notesTitle: String {
        if hasNotes {
            return self.cafe.notes[0]
        } else {
            return ""
        }
    }
    
    var notesBody: String {
        if hasNotes {
            return self.cafe.notes[1]
        } else {
            return ""
        }
    }
}
