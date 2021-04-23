//
//  Roastery.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 23.04.21.
//

import Foundation
import CoreLocation

struct Roastery: Codable {
    
    var name: String
    var hood: Hood
    var locationURL: String

    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: CoordinatesHelper.shared.sliceURLIntoCoordinates(url: locationURL).latitude,
            longitude: CoordinatesHelper.shared.sliceURLIntoCoordinates(url: locationURL).longitude)
    }
    
    var location: CLLocation {
        CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
}
