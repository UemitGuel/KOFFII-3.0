import SwiftUI

protocol Featureable {
    var feature: Feature { get }
}

struct AvailableFeature: Featureable {
    var feature: Feature
    var isAvailable: Bool
}

enum Feature: Int, CaseIterable {
    case wifi, food, vegan, plugin

    var title: String {
        switch self {
        case .wifi:
            return "WIFI"
        case .food:
            return "LUNCH"
        case .vegan:
            return "VEGAN"
        case .plugin:
            return "STROM"
        }
    }

    var airtableName: String {
        switch self {
        case .wifi:
            return "hasWifi"
        case .food:
            return "hasFood"
        case .vegan:
            return "hasVegan"
        case .plugin:
            return "hasPlug"
        }
    }

    var icon: Image {
        switch self {
        case .wifi:
            return Image(systemName: "wifi")
        case .food:
            return Image(systemName: "fork.knife")
        case .vegan:
            return Image(systemName: "camera.macro")
        case .plugin:
            return Image(systemName: "powerplug")
        }
    }
}

//struct Feature: Featureable {
//    var title: String
//    var airtableName: String
//    var icon: Image
//
//
//    let kind: Kind
//    var isActive = false
//
//    mutating func setActiveStatus(_ status: Bool) {
//        self.isActive = status
//    }
//
//
//}
