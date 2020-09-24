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
            VStack(alignment: .leading, spacing: 8.0) {
                if cafe.photo {
                    Image(cafe.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                } else {
                    Text("in Arbeit :)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color.gray)
                }
            }
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(cafe.name)
                        .lineLimit(1)
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.primary)
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
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
        .shadow(radius: 10)
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
