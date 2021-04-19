//
//  MapViewOverlay.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI

struct MapViewOverlay: View {
        
    @EnvironmentObject var mapViewStore: MapViewStore
    
    var model: CafeViewModel
    
    init(cafe: Cafe) {
        self.model = CafeViewModel(cafe: cafe)
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(model.name)
                            .font(.system(.headline, design: .rounded))
                        Text("\(model.hood)")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.primary).opacity(0.8)
                        Text(model.distance)
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.primary).opacity(0.8)
                    }
                    Spacer()
                    DismissButton(showsDetails: $mapViewStore.showDetails)
                    
                }
                
                FeatureDisplayView(cafe: model.cafe)
                GoogleMapsButton(cafe: model.cafe)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(radius: 10)
        }
        .padding()
        .padding(.bottom)
    }
}
