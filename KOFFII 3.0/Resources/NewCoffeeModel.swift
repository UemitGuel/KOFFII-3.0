//
//  NewCoffeeModel.swift
//  KOFFII 3.0
//
//  Created by Ümit Gül on 06.06.22.
//

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

    var hasWifi: Bool
    var hasFood: Bool
    var hasVegan: Bool
    var hasPlug: Bool

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
        imageURL = record.attachments["image"]?.first?.url as? URL ?? URL(string: "https://placehold.it/300")!
        locationURL = record.fields["url"] as? String ?? ""
        latAndLong = record.fields["latAndLong"] as? String ?? ""
        let features = record.fields["features"] as? Array<Any> ?? []
        hasWifi = features.contains { $0 as? String == "hasWifi" }
        hasFood = features.contains { $0 as? String == "hasFood" }
        hasVegan = features.contains { $0 as? String == "hasVegan" }
        hasPlug = features.contains { $0 as? String == "hasPlug" }
    }

    init() {
        name = "name"
        hood = Hood.innenstadt
        inSpotlight = true
        locationURL = "https://www.google.com/maps/place/Kaffeesaurus/@50.94036,6.93858,17z/data=!4m12!1m6!3m5!1s0x47bf2510697bb22f:0xeb89da280a86feef!2sKaffeesaurus!8m2!3d50.94036!4d6.93858!3m4!1s0x47bf2510697bb22f:0xeb89da280a86feef!8m2!3d50.94036!4d6.93858"
        hasWifi = true
        hasFood = true
        hasVegan = true
        hasPlug = true
        latAndLong = "50.921004288702065, 6.965932380099694"
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
}
