//
//  FeatureDisplayView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 14.05.21.
//

import SwiftUI

struct FeatureDisplayView: View {
    
    var cafe: FeatureDisplayViewModel
    
    init(cafe: Coffee) {
        self.cafe = FeatureDisplayViewModel(coffee: cafe)
    }
    
    var body: some View {
        HStack(spacing: 32) {
            Image(systemName: "wifi")
                .foregroundColor(cafe.hasWifi ? Color(.systemOrange) : Color(.secondaryLabel).opacity(0.8))
                .imageScale(cafe.hasWifi ? .large : .small)
            Image("FOOD")
                .foregroundColor(cafe.hasFood ? Color(.systemTeal) : Color(.secondaryLabel).opacity(0.8))
                .imageScale(cafe.hasFood ? .large : .small)
            Image(systemName: "leaf")
                .foregroundColor(cafe.hasVegan ? Color(.green) : Color(.secondaryLabel).opacity(0.8))
                .imageScale(cafe.hasVegan ? .large : .small)
            Image(systemName: "bolt")
                .foregroundColor(cafe.hasPlug ? Color(.systemYellow) : Color(.secondaryLabel).opacity(0.8))
                .imageScale(cafe.hasPlug ? .large : .small)
        }
    }
}

struct FeatureDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureDisplayView(cafe: cafeData[0])
    }
}
