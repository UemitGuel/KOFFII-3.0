//
//  InformationView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 24.04.21.
//

import SwiftUI

struct InformationView: View {
    
    @EnvironmentObject var model: InformationController
    @EnvironmentObject var weatherStore: WeatherStore
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(model.allInformation, id: \.title) { info in
                    NavigationLink(
                        destination: InformationDetailCoordinator(info: info),
                        label: {
                            InformationListItem(info: info)
                                .padding(.bottom)
                        })
                }
            }
        }
        .navigationTitle("Zubereitung & mehr")
        .addWeatherToolbarItem(with: weatherStore.model)
        .background(Color("Olive1"))
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
