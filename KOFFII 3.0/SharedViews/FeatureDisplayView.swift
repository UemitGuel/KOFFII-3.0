//
//  FeatureDisplayView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 14.05.21.
//

import SwiftUI

struct FeatureDisplayView: View {
    
    var cafe: CoffeeDetailViewModel
    
    init(cafe: NewCoffeeModel) {
        self.cafe = CoffeeDetailViewModel(coffee: cafe)
    }
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: "wifi")
                    .foregroundColor(cafe.featureList.contains(.wifi) ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
                    .imageScale(cafe.featureList.contains(.wifi) ? .large : .medium)
                Spacer()
                Divider()
                    .background(.white)
                Spacer()
                Image(systemName: "fork.knife")
                    .foregroundColor(cafe.featureList.contains(.food) ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
                    .imageScale(cafe.featureList.contains(.food) ? .large : .medium)
                Spacer()
            }
            Group {
                Divider()
                    .background(.white)
                Spacer()
                Image(systemName: "leaf")
                    .foregroundColor(cafe.featureList.contains(.vegan) ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
                    .imageScale(cafe.featureList.contains(.vegan) ? .large : .medium)
                Spacer()
                Divider()
                    .background(.white)
                Spacer()
                Image(systemName: "powerplug")
                    .foregroundColor(cafe.featureList.contains(.plugin) ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
                    .imageScale(cafe.featureList.contains(.plugin) ? .large : .medium)
            }
        }
        .padding(.horizontal)
    }
}
