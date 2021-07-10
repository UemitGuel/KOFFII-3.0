//
//  Feature.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 09.07.21.
//

import SwiftUI

enum Feature {
    case wifi, food, vegan, plugin
    
    var icon: Image {
        switch self {
        case .wifi:
            return Image(systemName: "wifi")
        case .food:
            return Image(systemName: "wifi")
        case .vegan:
            return Image(systemName: "wifi")
        case .plugin:
            return Image(systemName: "wifi")
        }
    }
}
