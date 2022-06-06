//
//  NewCoffeeModel.swift
//  KOFFII 3.0
//
//  Created by Ümit Gül on 06.06.22.
//

import AirtableKit
import Foundation
import CoreLocation

struct NewCoffeeModel {

    var name: String

    var hood: Hood
    var inSpotlight: Bool? = false

    var noteHeadline: String?
    var note: String?

    var imageURL: URL?

    var locationURL: String

    var hasWifi: Bool
    var hasFood: Bool
    var hasVegan: Bool
    var hasPlug: Bool


    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: CoordinatesHelper.shared.sliceURLIntoCoordinates(url: locationURL).latitude,
            longitude: CoordinatesHelper.shared.sliceURLIntoCoordinates(url: locationURL).longitude)
    }

    init(record: Record) {
        name = record.name ?? "name"
        hood = Hood(rawValue: record.fields["hood"] as? String ?? "") ?? Hood.innenstadt
        inSpotlight = record.fields["inSpotlight"] as? Int == 1
        noteHeadline = record.fields["noteHeadline"] as? String
        note = record.fields["note"] as? String
        imageURL = record.attachments["image"]?.first?.url as? URL ?? URL(string: "https://placehold.it/300")!
        locationURL = record.fields["url"] as? String ?? ""
        let features = record.fields["features"] as? Array<Any> ?? []
        hasWifi = features.contains { $0 as? String == "hasWifi" }
        hasFood = features.contains { $0 as? String == "hasFood" }
        hasVegan = features.contains { $0 as? String == "hasVegan" }
        hasPlug = features.contains { $0 as? String == "hasPlug" }
    }

}
