//
//  FeatureListBuilder.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 09.07.21.
//

import Foundation

struct FeatureListBuilder {
    
    static let shared = FeatureListBuilder()
    
    static func buildList(hasWifi: Bool, hasFood: Bool, hasVegan: Bool, hasPlug: Bool) -> [Feature] {
        var featureList: [Feature] = []
        if hasWifi {
            featureList.append(.wifi)
        }
        if hasFood {
            featureList.append(.food)
        }
        if hasVegan {
            featureList.append(.vegan)
        }
        if hasPlug {
            featureList.append(.plugin)
        }
        return featureList
    }
}
