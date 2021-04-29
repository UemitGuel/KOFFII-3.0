//
//  Complains.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 29.04.21.
//

import Foundation

struct Complain: Codable {
    let title: String
    let isEspresso: Bool
    let improvements: [String]
}
