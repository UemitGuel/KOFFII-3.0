//
//  Information.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 24.04.21.
//

import Foundation
import SwiftUI

struct Information: Codable, Comparable {
    
    static func < (lhs: Information, rhs: Information) -> Bool {
        lhs.title < rhs.title
    }
    
    static func == (lhs: Information, rhs: Information) -> Bool {
        lhs.title == rhs.title
    }
    
    let title: String
    var image: Image {
        return Image(title)
    }
    let quan: String?
    let temp: String?
    let time: String?
    let steps: [String]
    @DecodableDefault.False var isEspresso: Bool
    
}
