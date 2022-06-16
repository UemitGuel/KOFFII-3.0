//
//  FeatureDisplayView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 14.05.21.
//

import SwiftUI

struct FeatureDisplayView: View {
    
    var cafe: NewCoffeeModel
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: "wifi")
                    .foregroundColor(cafe.hasWifi ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
                    .imageScale(cafe.hasWifi ? .large : .medium)
                Spacer()
                Divider()
                    .background(.white)
                Spacer()
                Image(systemName: "fork.knife")
                    .foregroundColor(cafe.hasFood ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
                    .imageScale(cafe.hasFood ? .large : .medium)
                Spacer()
            }
            Group {
                Divider()
                    .background(.white)
                Spacer()
                Image(systemName: "leaf")
                    .foregroundColor(cafe.hasVegan ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
                    .imageScale(cafe.hasVegan ? .large : .medium)
                Spacer()
                Divider()
                    .background(.white)
                Spacer()
                Image(systemName: "powerplug")
                    .foregroundColor(cafe.hasPlug ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
                    .imageScale(cafe.hasPlug ? .large : .medium)
            }
        }
        .padding(.horizontal)
    }
}
