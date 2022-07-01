import Foundation
import MapKit

class CoordinatesHelper {
    
    static let shared = CoordinatesHelper()

    func sliceURLIntoCoordinates(url: String) -> (latitude: Double, longitude: Double) {
        var coordinates = (0.00,0.00)
        if url.isEmpty {
            return coordinates
        }

        // e.g 50.9338483636385, 6.9382019475465375
        let indexFirstComa = url.firstIndex(of: ",") ?? url.endIndex
        let urlBeforeFirstComa = String(url[...indexFirstComa].dropLast()).trimmingCharacters(in: .whitespaces)
        // 50.9338483636385

        let urlAfterFirstComa = String(url[indexFirstComa...].dropFirst()).trimmingCharacters(in: .whitespaces)
        // 6.9382019475465375..

        coordinates.0 = Double(urlBeforeFirstComa) ?? 0.00
        coordinates.1 = Double(urlAfterFirstComa) ?? 0.00

        return coordinates
    }

    func getDistanceFor(_ model: CoffeeModel, userLocation: CLLocation) -> String? {
        let cafeLocation = CLLocation(latitude: model.coordinates.latitude, longitude: model.coordinates.longitude)
        let distance = cafeLocation.distance(from: userLocation)

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
