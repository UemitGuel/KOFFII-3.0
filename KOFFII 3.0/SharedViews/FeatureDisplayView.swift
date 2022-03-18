//
//  FeatureDisplayView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 14.05.21.
//

import SwiftUI

struct FeatureDisplayView: View {
    
    var cafe: CoffeeDetailViewModel
    
    init(cafe: Coffee) {
        self.cafe = CoffeeDetailViewModel(coffee: cafe)
    }
    
    var body: some View {
        HStack(spacing: 32) {
            Image(systemName: "wifi")
                .foregroundColor(cafe.featureList.contains(.wifi) ? Color(.systemOrange) : Color(.secondaryLabel).opacity(0.8))
                .imageScale(cafe.featureList.contains(.wifi) ? .large : .small)
            Image(systemName: "fork.knife")
                .foregroundColor(cafe.featureList.contains(.food) ? Color(.systemTeal) : Color(.secondaryLabel).opacity(0.8))
                .imageScale(cafe.featureList.contains(.food) ? .large : .small)
            Image(systemName: "leaf")
                .foregroundColor(cafe.featureList.contains(.vegan) ? Color(.green) : Color(.secondaryLabel).opacity(0.8))
                .imageScale(cafe.featureList.contains(.vegan) ? .large : .small)
            Image(systemName: "powerplug")
                .foregroundColor(cafe.featureList.contains(.plugin) ? Color(.systemYellow) : Color(.secondaryLabel).opacity(0.8))
                .imageScale(cafe.featureList.contains(.plugin) ? .large : .small)
        }
    }
}

struct FeatureDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureDisplayView(cafe: cafeData[6])
    }
}
