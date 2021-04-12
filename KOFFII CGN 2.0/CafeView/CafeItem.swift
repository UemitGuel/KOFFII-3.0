//
//  CoffeeItem.swift
//
//  KOFFII CGN 2.0
//
// Created by Ümit Gül on 21.09.20.

import SwiftUI

struct CafeItem: View {
    
    var cafe: Cafe
    
    @EnvironmentObject var store: LocationStore
    
    var body: some View {
        HStack(alignment: .center) {
            Text(store.getDistanceAsString(cafeLocation: cafe.location))
                .font(.title3)
                .foregroundColor(Color.primary)
            VStack(alignment: .leading) {
                Text(cafe.name)
                    .foregroundColor(Color.primary)
                    .lineLimit(1)
                    .font(.system(.headline, design: .rounded))
                Text(cafe.hood.rawValue)
                    .foregroundColor(Color.secondary)
                    .lineLimit(1)
                FeatureDisplayView(cafe: cafe)
            }
            Image(systemName: "chevron.right")
                .foregroundColor(Color.secondary)
        }
        .font(.subheadline)
        .padding(.vertical)
    }
}


struct CoffeeItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CafeItem(cafe: cafeData[5])
                .preferredColorScheme(.dark)
        }
    }
}

struct FeatureDisplayView: View {
    
    var cafe: Cafe
    
    var body: some View {
        HStack {
            Image(systemName: "wifi")
                .foregroundColor(cafe.hasWifi ? .primary : Color(.tertiaryLabel).opacity(0.8))
            Spacer()
            Image("FOOD")
                .foregroundColor(cafe.hasFood ? .primary : Color(.tertiaryLabel).opacity(0.8))
            Spacer()
            Image(systemName: "leaf")
                .foregroundColor(cafe.hasVegan ? .primary : Color(.tertiaryLabel).opacity(0.8))
            Spacer()
            Image(systemName: "bolt")
                .foregroundColor(cafe.hasPlug ? .primary : Color(.tertiaryLabel).opacity(0.8))
        }
        .padding(.horizontal)
    }
}
