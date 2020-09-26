//
//  CoffeeItem.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeItem: View {
    
    var cafe: Cafe
    
    @EnvironmentObject var store: LocationStore
    
    var body: some View {
        VStack {
            Image(cafe.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(cafe.name)
                        .lineLimit(1)
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.primary)
                    Text(cafe.hood.rawValue)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                    Text(store.getDistanceAsString(cafeLocation: cafe.location))
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                }
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            
            FeatureDisplayView(cafe: cafe)
        }
        .frame(height: 400)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
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
            Spacer()
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
            Spacer()
        }
        .padding(.vertical)
    }
}
