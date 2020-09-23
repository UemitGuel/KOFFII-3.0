//
//  Location.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 23.09.20.
//

import SwiftUI
import MapKit

struct Location {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

extension Location: Identifiable { }
 
extension Location {
    static func getLocation(name: String, coordinate: CLLocationCoordinate2D ) -> [Location] {
        return [
            Location(name: name, coordinate: coordinate)
        ]
    }
    
    static func getRegion(coordinates: CLLocationCoordinate2D, coordinate: CLLocationCoordinate2D ) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    }
}
