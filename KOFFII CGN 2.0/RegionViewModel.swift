//
//  RegionViewModel.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 23.09.20.
//

import Foundation
import MapKit

class RegionViewModel: ObservableObject {
    
    @Published var region: MKCoordinateRegion
    
    init() {
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.939506, longitude: 6.946490), span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06))
    }
    
    func setRegion(coordinates: CLLocationCoordinate2D) {
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude), span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06))
    }
}
