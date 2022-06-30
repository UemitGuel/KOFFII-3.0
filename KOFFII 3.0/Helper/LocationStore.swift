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
        locationManager.startUpdatingLocation()
      } else {
        locationManager.requestWhenInUseAuthorization()
      }
    }
    
    func getDistanceFor(_ model: NewCoffeeModel) -> String? {
        guard let previousLocation = previousLocation else {
            return nil
        }

        let cafeLocation = CLLocation(latitude: model.coordinates.latitude, longitude: model.coordinates.longitude)
        let distance = cafeLocation.distance(from: previousLocation)

        return mapDistanceForDisplay(distance)
    }

    private func mapDistanceForDisplay(_ distance: CLLocationDistance) -> String {
        if distance < 100 {
            return "100 m"
        } else if distance < 200 {
            return "200 m"
        } else if distance < 300 {
            return "300 m"
        } else if distance < 400 {
            return "400 m"
        } else if distance < 500 {
            return "500 m"
        } else if distance < 600 {
            return "600 m"
        } else if distance < 700 {
            return "700 m"
        } else if distance < 800 {
            return "800 m"
        } else if distance < 900 {
            return "900 m"
        } else if distance < 1000 {
            return "1 km"
        } else if distance < 1200 {
            return "1.2 km"
        } else if distance < 1500 {
            return "1.5 km"
        } else if distance < 2000 {
            return "2 km"
        } else if distance < 5000 {
            return "5 km"
        } else if distance < 10000 {
            return "10 km"
        } else {
            return "+10 km"
        }
    }
}

extension LocationStore: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
      if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
        locationManager.startUpdatingLocation()
          userPermission = true
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
