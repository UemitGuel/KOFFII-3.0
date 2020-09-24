
// e.g url = "https://www.google.de/maps/place/Bambule.Kaffeebar/@50.9369514,7.006572,17z/data=!4m12!1m6!3m5!1s0x47bf2670189ef6e5:0x25d077e0f785182!2sKundenzentrum+Kalk+-+Stadt+Köln!8m2!3d50.939315!4d7.0090109!3m4!1s0x47bf267ab6e8fd81:0x2fa936a61a5aa55c!8m2!3d50.9369497!4d7.0087637"


import Foundation

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
    
}
