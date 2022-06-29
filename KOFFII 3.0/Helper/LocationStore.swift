import Foundation
import CoreLocation

class LocationStore: NSObject, ObservableObject {

    var locationManager = CLLocationManager()
    var previousLocation: CLLocation?

    @Published var userPermission: Bool = false

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func startLocationServices() {
      if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
          userPermission = true
        locationManager.startUpdatingLocation()
      } else {
        locationManager.requestWhenInUseAuthorization()
      }
    }
    
    func getDistanceAsString(cafeLocation: CLLocation) -> String {
        let distance = CoordinatesHelper.shared.getDistance(cafeLocation: cafeLocation, userLocation: previousLocation)
        return CoordinatesHelper.shared.mapDistanceForDisplay(distance)
    }
    
}

extension LocationStore: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
      if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
        locationManager.startUpdatingLocation()
      }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latest = locations.first else { return }
        previousLocation = latest
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      guard let clError = error as? CLError else { return }
      switch clError {
      case CLError.denied:
        print("Access denied")
      default:
        print("Catch all errors")
      }
    }
}
