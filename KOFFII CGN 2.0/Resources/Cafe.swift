//
//  Cafe.swift
//  KOFFII CGN 2
//
//  Created by Ümit Gül on 20.04.20.
//  Copyright © 2020 Ümit Gül. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Cafe: Hashable, Identifiable, Codable {
    let id = UUID()
    var name: String
    var photo: Bool
    
    var locationURL: String
    
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: CoordinatesHelper.shared.sliceURLIntoCoordinates(url: locationURL).latitude,
            longitude: CoordinatesHelper.shared.sliceURLIntoCoordinates(url: locationURL).longitude)
    }
    
    var location: CLLocation {
        CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    var hasWifi: Bool
    var hasFood: Bool
    var hasVegan: Bool
    var hasPlug: Bool
    
    var hood: Hood
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
}
