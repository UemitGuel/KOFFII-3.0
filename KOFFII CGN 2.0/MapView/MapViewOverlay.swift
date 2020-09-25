//
//  MapViewOverlay.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI

struct MapViewOverlay: View {
    
    @EnvironmentObject var store: LocationStore
    
    @EnvironmentObject var mapViewStore: MapViewStore
    
    var cafe: Cafe
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(cafe.name)
                            .font(.system(.headline, design: .rounded))
                        Text("\(cafe.hood.rawValue)")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.primary).opacity(0.8)
                        Text(store.getDistanceAsString(cafeLocation: cafe.location))
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.primary).opacity(0.8)
                    }
                    Spacer()
                    DismissButton(showsDetails: $mapViewStore.showDetails)
                    
                }
                
                FeatureDisplayView(cafe: cafe)
                
                
                GoogleMapsButton(cafe: cafe)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .shadow(radius: 10)
        }
        .padding()
        .padding(.bottom)
    }
}

struct MapViewOverlay_Previews: PreviewProvider {
    static var previews: some View {
        MapViewOverlay(cafe: cafeData[0])
    }
}
