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
        
    @EnvironmentObject var model: CafeListViewModel
    @EnvironmentObject var mapViewStore: MapViewStore
    
    @State private var isPresented = false
    
    var body: some View {
        MapView(centerCoordinate: $centerCoordinate)
            .sheet(isPresented: $mapViewStore.showDetails) {
                CafeDetailView(cafe: mapViewStore.chosenCafe)
            }
            .navigationTitle("Karte")
    }
}

struct AllCafesMapView_Previews: PreviewProvider {
    static var previews: some View {
        AllCafesMapView()
    }
}
