
// e.g url = "https://www.google.de/maps/place/Bambule.Kaffeebar/@50.9369514,7.006572,17z/data=!4m12!1m6!3m5!1s0x47bf2670189ef6e5:0x25d077e0f785182!2sKundenzentrum+Kalk+-+Stadt+Köln!8m2!3d50.939315!4d7.0090109!3m4!1s0x47bf267ab6e8fd81:0x2fa936a61a5aa55c!8m2!3d50.9369497!4d7.0087637"


import Foundation
import MapKit

class CoordinatesHelper {
    
    static let shared = CoordinatesHelper()
    
    func sliceURLIntoCoordinates(url: String) -> (latitude: Double, longitude: Double) {
        var coordinates = (0.00,0.00)
        let indexFirstComa = url.firstIndex(of: ",") ?? url.endIndex
        let urlBeforeFirstComa = String(url[...indexFirstComa].dropLast())
        // e.g https://www.google.de/maps/place/Bambule.Kaffeebar/@50.9369514
        
        let urlAfterFirstComa = String(url[indexFirstComa...].dropFirst())
        // e.g 7.006572,17z/data=!4m12!1m6!3m5!1s0x47bf2...
        
        coordinates.0 = getLatitude(urlBeforeFirstComa: urlBeforeFirstComa)
        coordinates.1 = getLongitude(urlAfterFirstComa: urlAfterFirstComa)
        
        return coordinates
    }
    
    private func getLatitude(urlBeforeFirstComa: String) -> Double {
        let atIndex = urlBeforeFirstComa.firstIndex(of: "@") ?? urlBeforeFirstComa.endIndex
        let latitudeString = urlBeforeFirstComa[atIndex...].dropFirst()
        let latitude = Double(latitudeString) ?? 0.00
        return latitude
    }
    
    private func getLongitude(urlAfterFirstComa: String) -> Double {
        let indexSecondComa = urlAfterFirstComa.firstIndex(of: ",") ?? urlAfterFirstComa.endIndex
        let longitudeString = String(urlAfterFirstComa[..<indexSecondComa])
        let longitude = Double(longitudeString) ?? 0.00
        return longitude
    }
    
    func getDistance(cafeLocation: CLLocation, userLocation: CLLocation?) -> String {
        guard let userLocation = userLocation else { return "" }
        let distance = cafeLocation.distance(from: userLocation)
        print(userLocation)
        print(cafeLocation)
        print(distance)
        return mapDistanceForDisplay(distance)
    }
    
    func mapDistanceForDisplay(_ distance: CLLocationDistance) -> String {
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
            return "5km"
        } else if distance < 10000 {
            return "10km"
        } else {
            return "+10km"
        }
    }
}
