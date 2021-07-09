//
//  Cafe.swift
//  KOFFII CGN 2
//
//  Created by Ümit Gül on 20.04.20.
//  Copyright © 2020 Ümit Gül. All rights reserved.
//

import SwiftUI
import CoreLocation

// CoffeeItems can be Cafes but also Roasteries
struct Coffee: Codable, Comparable {
    
    static func < (lhs: Coffee, rhs: Coffee) -> Bool {
        lhs.name < rhs.name
    }
    
    static func == (lhs: Coffee, rhs: Coffee) -> Bool {
        lhs.name == rhs.name
    }
    
    var name: String
    @DecodableDefault.False var inSpotlight: Bool

    var hours: [Hours]?
    @DecodableDefault.EmptyList var notes: [String]
    
    var locationURL: String
    
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: CoordinatesHelper.shared.sliceURLIntoCoordinates(url: locationURL).latitude,
            longitude: CoordinatesHelper.shared.sliceURLIntoCoordinates(url: locationURL).longitude)
    }
    
    var location: CLLocation {
        CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    @DecodableDefault.False var hasWifi: Bool
    @DecodableDefault.False var hasFood: Bool
    @DecodableDefault.False var hasVegan: Bool
    @DecodableDefault.False var hasPlug: Bool
    
    var hood: Hood
    
    struct Hours: Codable {
        let day, start, end: String
    }
    
    @DecodableDefault.False var isRoastery: Bool
}

enum Hood: String, CaseIterable, Codable, Hashable {
    case all = "Alle Viertel"
    case deutz = "Deutz/Kalk"
    case lindenthal = "Lindenthal/Sülz"
    case nippes = "Nippes"
    case ehrenfeld = "Ehrenfeld"
    case südstadt = "Südstadt"
    case innenstadt = "Innenstadt"
    case belgisches = "Belgisches Viertel"
    case latin = "Latin Quarter"
}
