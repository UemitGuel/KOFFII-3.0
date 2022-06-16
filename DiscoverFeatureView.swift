//
//  DiscoverFeatureView.swift
//  KOFFII 3.0
//
//  Created by Ümit Gül on 16.06.22.
//

import SwiftUI

struct DiscoverFeatureView: View {

    var cafe: NewCoffeeModel

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                DiscoverViewFeatureItem(title: "WIFI", imageName: "wifi", cafe: cafe)
                DiscoverViewFeatureItem(title: "LUNCH", imageName: "fork.knife", cafe: cafe)
            }
            HStack(spacing: 16) {
                DiscoverViewFeatureItem(title: "VEGAN", imageName: "leaf", cafe: cafe)
                DiscoverViewFeatureItem(title: "STROM", imageName: "powerplug", cafe: cafe)
            }
        }
    }
}

struct DiscoverViewFeatureItem: View {

    let title: String
    let imageName: String
    let cafe: NewCoffeeModel

    var body: some View {
        HStack {
            Text(title)
            Image(systemName: imageName)
                .foregroundColor(cafe.hasWifi ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
        }
        .padding(4)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.white, lineWidth: 0.5)
        )
    }
}
