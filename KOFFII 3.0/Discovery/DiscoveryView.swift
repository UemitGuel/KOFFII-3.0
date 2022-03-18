//
//  Top3View.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 26.09.20.
//

import SwiftUI

struct DiscoveryView: View {
    
    @EnvironmentObject var weatherStore: WeatherStore

    var body: some View {
        ScrollView {
            NavigationLink(
                destination: CoffeeDetailView(coffee: discoverCafes[0].coffee)) {
                DiscoverItem(cafe: discoverCafes[0])
            }
            .padding(.bottom)
            #if !APPCLIP
            NavigationLink(
                destination: InformationDetailCoordinator(info: informationData[2]),
                label: {
                    InformationListItem(info: informationData[2])
                        .padding(.bottom)
                })
                .padding(.bottom)
            #endif
            NavigationLink(
                destination: CoffeeDetailView(coffee: roasteryData[0])) {
                CoffeeListItem(coffee: roasteryData[0])
            }
            .padding(.bottom)
            NavigationLink(
                destination: CoffeeDetailView(coffee: discoverCafes[1].coffee)) {
                DiscoverItem(cafe: discoverCafes[1])
            }
            .padding(.bottom)
            .navigationTitle("Empfehlungen")
            .addWeatherToolbarItem(with: weatherStore.model)
        }
        .background(Color("Olive1"))
    }
}
