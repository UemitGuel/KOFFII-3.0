//
//  AllCafesMapView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI
import MapKit

struct AllCafesMapView: View {
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
        
    @EnvironmentObject var mapViewStore: MapViewStore
    
    var body: some View {
        MapView(centerCoordinate: $centerCoordinate)
            .edgesIgnoringSafeArea(.top)
            .overlay(mapViewStore.showDetails ?
                    MapViewOverlay(cafe: mapViewStore.chosenCafe) : nil)
    }
}

struct AllCafesMapView_Previews: PreviewProvider {
    static var previews: some View {
        AllCafesMapView()
    }
}
