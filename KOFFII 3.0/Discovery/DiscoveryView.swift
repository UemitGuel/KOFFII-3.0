//
//  Top3View.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 26.09.20.
//

import SwiftUI

struct DiscoveryView: View {
    
    @EnvironmentObject var weatherStore: WeatherStore
    @EnvironmentObject var viewModel: CoffeeListViewModel

    @State var sheetDetail: CoffeeModel?

    var body: some View {
        ScrollView {
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Spacer()
                Image(systemName: "square.and.arrow.down")
                Image(systemName: "square.and.arrow.up")
                Text(": Down-/Upload Geschwindigkeit")
            }
            .font(.footnote)
            .padding(.trailing)
            ForEach(viewModel.newCoffeeListSpotlight, id: \.name) { coffee in
                Button {
                    sheetDetail = coffee
                } label: {
                    DiscoverItem(cafe: coffee)
                }
                .buttonStyle(.plain)
                .padding(.bottom)
            }
            .navigationTitle("Empfehlungen")
        }
        .addWeatherToolbarItem(with: weatherStore.model)
        .background(Color("Olive1"))
        .sheet(item: $sheetDetail) { coffee in
            CoffeeDetailView(model: coffee)
        }

        //            #if !APPCLIP
        //            NavigationLink(
        //                destination: InformationDetailCoordinator(info: informationData[2]),
        //                label: {
        //                    InformationListItem(info: informationData[2])
        //                        .padding(.bottom)
        //                })
        //                .padding(.bottom)
        //            #endif
        //            NavigationLink(
        //                destination: CoffeeDetailView(coffee: roasteryData[0])) {
        //                CoffeeListItem(coffee: roasteryData[0])
        //            }
        //            .padding(.bottom)
        //            NavigationLink(
        //                destination: CoffeeDetailView(coffee: discoverCafes[1].coffee)) {
        //                DiscoverItem(cafe: discoverCafes[1])
        //            }
        //            .padding(.bottom)

    }
}
