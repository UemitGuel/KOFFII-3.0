//
//  FeatureDisplayViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 14.05.21.
//

import Foundation

struct FeatureDisplayViewModel: Identifiable {
    
    let id = UUID()
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var hasWifi: Bool {
        return self.coffee.hasWifi
    }
    var hasFood: Bool {
        return self.coffee.hasFood
    }

    var hasVegan: Bool {
        return self.coffee.hasVegan
    }

    var hasPlug: Bool {
        return self.coffee.hasPlug
    }
}
