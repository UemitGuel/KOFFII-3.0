//
//  FilterButtons.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 22.09.20.
//

import SwiftUI

struct FilterView: View {
    
    @ObservedObject var model: CafeListViewModel
    
    var body: some View {
        HStack(spacing: 8) {
            FilterItem(iconImage: Image(systemName: "wifi"), filterItem: "Wifi", feature: $model.needWifi, model: model)
            FilterItem(iconImage: Image("FOOD"), filterItem: "Lunch", feature: $model.needFood, model: model)
            FilterItem(iconImage: Image(systemName: "leaf"), filterItem: "Vegan", feature: $model.needVegan, model: model)
            FilterItem(iconImage: Image(systemName: "bolt"), filterItem: "Strom", feature: $model.needPlug, model: model)
            Spacer()
        }
    }
}

struct FilterItem: View {
    let impactMed = UIImpactFeedbackGenerator(style: .soft)
    var iconImage: Image
    var filterItem: String
    @Binding var feature: Bool
    @ObservedObject var model: CafeListViewModel
    
    var body: some View {
        Button(action: {
            self.feature.toggle()
            impactMed.impactOccurred()
            model.filterCafeList()
        }) {
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
