import AirtableKit
import Foundation
import CoreLocation

struct NewCoffeeModel: Identifiable {

    var id = UUID()
    var name: String

    var hood: Hood
    var inSpotlight: Bool? = false

    var noteHeadline: String?
    var note: String?

    var imageURL: URL?

    var locationURL: String
    var latAndLong: String

    var features: [AvailableFeature] = []

    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: CoordinatesHelper.shared.sliceURLIntoCoordinates(url: latAndLong).latitude,
            longitude: CoordinatesHelper.shared.sliceURLIntoCoordinates(url: latAndLong).longitude)
    }

    init(record: Record) {
        name = record.name ?? "name"
        hood = Hood(rawValue: record.fields["hood"] as? String ?? "") ?? Hood.innenstadt
        inSpotlight = record.fields["inSpotlight"] as? Int == 1
        noteHeadline = record.fields["noteHeadline"] as? String
        note = record.fields["note"] as? String
        imageURL = record.attachments["image"]?.first?.url as? URL ?? nil
        locationURL = record.fields["url"] as? String ?? ""
        latAndLong = record.fields["latAndLong"] as? String ?? ""

        // MARK: Features
        let featuresArray = record.fields["features"] as? Array<String> ?? []
        handle(featuresArray: featuresArray)
    }

    private mutating func handle(featuresArray: Array<String>) {
        for feature in Feature.allCases {
            if featuresArray.contains(where: { $0 == feature.airtableName }) {
                self.features.append(AvailableFeature(feature: feature, isAvailable: true))
            } else {
                self.features.append(AvailableFeature(feature: feature, isAvailable: false))
            }
        }
    }

    init() {
        name = "name"
        hood = Hood.innenstadt
        inSpotlight = true
        locationURL = "https://www.google.com/maps/place/Kaffeesaurus/@50.94036,6.93858,17z/data=!4m12!1m6!3m5!1s0x47bf2510697bb22f:0xeb89da280a86feef!2sKaffeesaurus!8m2!3d50.94036!4d6.93858!3m4!1s0x47bf2510697bb22f:0xeb89da280a86feef!8m2!3d50.94036!4d6.93858"
        latAndLong = "50.921004288702065, 6.965932380099694"
        features.append(AvailableFeature(feature: .wifi, isAvailable: true))

    }

}

enum Hood: String, CaseIterable, Codable, Hashable {
    case all = "Alle Viertel"
    case deutz = "Deutz/Kalk"
    case lindenthal = "Lindenthal/Sülz"
    case nippes = "Nippes"
    case ehrenfeld = "Ehrenfeld"
    case südstadt = "Südstadt"
    case innenstadt = "Innenstadt"
    case belgisches = "Belgisches Viertel"
    case latin = "Latin Quarter"
    case mülheim = "Mülheim"
}
