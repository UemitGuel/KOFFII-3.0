//
//  FeatureDisplayView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 14.05.21.
//

import SwiftUI

struct FeatureDisplayView: View {
    
    var features: [Feature]
    
    var body: some View {
        HStack {
            ForEach(features.indices, id: \.self) { index in
                features[index].kind.icon
                    .foregroundColor(features[index].isActive ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
                    .imageScale(features[index].isActive ? .large : .medium)
                if index != features.count - 1 {
                    Spacer()
                    Divider()
                        .background(.white)
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}
