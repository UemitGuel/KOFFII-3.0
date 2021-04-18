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
        VStack(alignment: .leading) {
            HStack{
                FeatureDisplayView(cafe: cafe)
                Spacer()
                Text(store.getDistanceAsString(cafeLocation: cafe.location))
                Image(systemName: "chevron.forward")
            }
            .font(.system(.body, design: .rounded))
            .foregroundColor(.secondary)
            .padding([.horizontal, .top])
            Spacer()
            VStack(alignment: .leading) {
                Text(cafe.name)
                    .bold()
                    .font(.system(.title, design: .rounded))
                Text(cafe.hood.rawValue)
                    .foregroundColor(Color(.secondaryLabel))
                    .font(.system(.body, design: .rounded))
            }
            .padding([.horizontal, .bottom])
        }
        .background(Color(.secondarySystemBackground))
        .frame(height: 125)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}


struct CoffeeItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CafeItem(cafe: cafeData[5])
                .preferredColorScheme(.dark)
                .environmentObject(LocationStore())
        }
    }
}

struct FeatureDisplayView: View {
    
    var cafe: Cafe
    
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
