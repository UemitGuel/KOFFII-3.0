//
//  Complains.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 29.04.21.
//

import CloudKit

struct Complain: Codable {
    let title: String
    let isEspresso: Bool
    let improvements: [String]
    
    init?(record: CKRecord) {
        guard
            let title = record["title"] as? String,
            let isEspresso = record["isEspresso"] as? Bool,
            let improvements = record["improvements"] as? [String]
        else { return nil }
        self.title = title
        self.isEspresso = isEspresso
        self.improvements = improvements
    }
}
