//
//  DiscoverFeatureView.swift
//  KOFFII 3.0
//
//  Created by Ümit Gül on 16.06.22.
//

import SwiftUI

struct DiscoverFeatureView: View {

    let features: [Feature]

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                DiscoverViewFeatureItem(feature: features[0])
                DiscoverViewFeatureItem(feature: features[1])
            }
            HStack(spacing: 16) {
                DiscoverViewFeatureItem(feature: features[2])
                DiscoverViewFeatureItem(feature: features[3])
            }
        }
    }
}

struct DiscoverViewFeatureItem: View {

    let feature: Feature

    var body: some View {
        HStack {
            Text(feature.kind.title)
            feature.kind.icon
        }
        .foregroundColor(feature.isActive ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
        .padding(4)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.white, lineWidth: 0.5)
        )
    }
}
