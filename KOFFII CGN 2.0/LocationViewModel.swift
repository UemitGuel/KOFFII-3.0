//
//  LocationViewModel.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 23.09.20.
//

import SwiftUI
import CoreLocation

class LocationViewModel: NSObject, ObservableObject {
    
    @Published var userLat: Double = 0
    @Published var userLng: Double = 0
    
    @Published var locationStatus = "..."
        
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func checkLocationAccuracyAllowed() {
        switch locationManager.accuracyAuthorization {
        case .reducedAccuracy:
            locationStatus = "ungefähre Position"
        case .fullAccuracy:
            locationStatus = "genaue Position"
        @unknown default:
            locationStatus = "unbekannt"
        }
        
        locationManager.startUpdatingLocation()

    }
    
    func requestLocationAuth() {

        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyReduced

        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            locationStatus = "authorized always"
            checkLocationAccuracyAllowed()
        case .authorizedWhenInUse:
            locationStatus = "authorized when in use"
            checkLocationAccuracyAllowed()
        case .notDetermined:
            locationStatus = "not determined"
        case .restricted:
            locationStatus = "restricted"
        case .denied:
            locationStatus = "denied"
        default:
            locationStatus = "other"
        }
        
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
  
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLat = location.coordinate.latitude
        userLng = location.coordinate.longitude
   }
    
   func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        let status = manager.authorizationStatus
        let accuracyStatus = manager.accuracyAuthorization
        
        if(status == .authorizedWhenInUse || status == .authorizedAlways){
            
            if accuracyStatus == CLAccuracyAuthorization.reducedAccuracy{
                locationManager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "wantAccurateLocation", completion: { [self]
                    error in
                    
                    if locationManager.accuracyAuthorization == .fullAccuracy{
                        locationStatus = "Full Accuracy Location Access Granted Temporarily"
                    }
                    else{
                        locationStatus = "Approx Location As User Denied Accurate Location Access"
                    }
                    locationManager.startUpdatingLocation()
                })
            }
        }
        else{
            requestLocationAuth()
        }
    }
}
