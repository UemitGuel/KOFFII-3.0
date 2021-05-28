//
//  CafeDetailViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 19.04.21.
//

import Foundation
import CoreLocation
import SwiftUI

struct CoffeeDetailViewModel: Identifiable {
    
    let id = UUID()
    let locationStore = LocationStore.shared
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var isRoastery: Bool {
        return self.coffee.isRoastery
    }
    
    var coordinates: CLLocationCoordinate2D {
        return self.coffee.coordinates
    }
    
    var distance: String {
        return self.locationStore.getDistanceAsString(cafeLocation: coffee.location)
    }
    
    var locationURL: String {
        return self.coffee.locationURL
    }
    
    var name: String {
        return self.coffee.name
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
    
    var hasImage: Bool {
        let image = UIImage(named: name)
        return image != nil
    }
    
    var hasNotes: Bool {
        return !self.coffee.notes.isEmpty
    }
    
    var notesTitle: String {
        if hasNotes {
            return self.coffee.notes[0]
        } else {
            return ""
        }
    }
    
    var notesBody: String {
        if hasNotes {
            return self.coffee.notes[1]
        } else {
            return ""
        }
    }
}

extension CoffeeDetailViewModel {

    var hoursMo: String {
        guard let start = self.coffee.hours?[0].start, let end = self.coffee.hours?[0].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursDi: String {
        guard let start = self.coffee.hours?[1].start, let end = self.coffee.hours?[1].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursMi: String {
        guard let start = self.coffee.hours?[2].start, let end = self.coffee.hours?[2].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursDo: String {
        guard let start = self.coffee.hours?[3].start, let end = self.coffee.hours?[3].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursFr: String {
        guard let start = self.coffee.hours?[4].start, let end = self.coffee.hours?[4].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursSa: String {
        guard let start = self.coffee.hours?[5].start, let end = self.coffee.hours?[5].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursSo: String {
        guard let start = self.coffee.hours?[6].start, let end = self.coffee.hours?[6].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
}
