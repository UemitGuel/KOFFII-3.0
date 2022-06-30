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
}
