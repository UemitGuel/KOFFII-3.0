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
    @EnvironmentObject var model: CoffeeListViewModel
    
    @State private var isPresented = false
    
    var body: some View {
        MapView(coffeeList: $model.coffeeList, centerCoordinate: $centerCoordinate)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresented.toggle()
                    } ) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $mapViewStore.showDetails) {
                CoffeeDetailView(coffee: mapViewStore.chosenCafe)
            }
            // TODO: After WWDC 2021, maybe better MapView for SwiftUI
            
            //            .sheet(isPresented: $isPresented) {
            //                FilterFormView()
            //            }
            .navigationTitle("Karte")
    }
}

struct AllCafesMapView_Previews: PreviewProvider {
    static var previews: some View {
        AllCafesMapView()
    }
}
