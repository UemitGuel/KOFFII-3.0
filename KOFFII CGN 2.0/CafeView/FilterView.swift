//
//  FilterButtons.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 22.09.20.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var needWifi: Bool
    @Binding var needFood: Bool
    @Binding var needVegan: Bool
    @Binding var needPlug: Bool
        
    var body: some View {
        HStack(spacing: 8) {
            FilterItem(iconImage: Image(systemName: "wifi"), filterItem: "Wifi", feature: $needWifi)
            FilterItem(iconImage: Image("FOOD"), filterItem: "Lunch", feature: $needFood)
            FilterItem(iconImage: Image(systemName: "leaf"), filterItem: "Vegan", feature: $needVegan)
            FilterItem(iconImage: Image(systemName: "bolt"), filterItem: "Strom", feature: $needPlug)
            Spacer()
        }
    }
}

struct FilterButtons_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FilterView(needWifi: .constant(false), needFood: .constant(false), needVegan: .constant(false), needPlug: .constant(false))
                .preferredColorScheme(.dark)
            FilterView(needWifi: .constant(false), needFood: .constant(false), needVegan: .constant(false), needPlug: .constant(false))
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}

struct FilterItem: View {
    var iconImage: Image
    var filterItem: String
    @Binding var feature: Bool
    
    var body: some View {
        Button(action: { self.feature.toggle() }) {
            VStack(spacing: 8) {
                iconImage
                Text(filterItem)
                    .lineLimit(1)
                    .font(.footnote)
            }
            .foregroundColor(feature ? Color(.systemBackground) : Color(.label))
            .frame(width: 66,height: 44)
            .padding(8)
        }
        .background(feature ? Color.accentColor : Color.init(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
//        .overlay(
//            RoundedRectangle(cornerRadius: 16)
//                .stroke(Color.accentColor, lineWidth: 1)
//        )
    }
}
