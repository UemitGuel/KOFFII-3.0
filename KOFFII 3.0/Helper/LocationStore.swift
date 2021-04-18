//
//  LocationViewModel.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 23.09.20.
//

import Foundation
import Combine
import CoreLocation

class LocationStore: NSObject, ObservableObject{
    
    @Published var userLatitude: Double = 0
    @Published var userLongitude: Double = 0
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func getDistance(cafeLocation: CLLocation) -> Double {
        let userLocation = CLLocation(latitude: userLatitude, longitude: userLongitude)
        return CoordinatesHelper.shared.getDistance(cafeLocation: cafeLocation, userLocation: userLocation)
    }
    
    func getDistanceAsString(cafeLocation: CLLocation) -> String {
        let distance = getDistance(cafeLocation: cafeLocation)
        return CoordinatesHelper.shared.mapDistanceForDisplay(distance)
    }
    
}

extension LocationStore: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLatitude = location.coordinate.latitude
        userLongitude = location.coordinate.longitude
    }
}
