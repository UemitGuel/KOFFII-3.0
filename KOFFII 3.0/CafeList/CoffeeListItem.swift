//
//  CoffeeItem.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI
import CoreLocation

struct CoffeeListItem: View {
    
    var model: NewCoffeeModel

    @EnvironmentObject var locationStore: LocationStore


    var location: CLLocation {
        CLLocation(latitude: model.coordinates.latitude, longitude: model.coordinates.longitude)
    }

    var distance: String {
        return self.locationStore.getDistanceAsString(cafeLocation: location)
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                //                if model.isRoastery {
                //                    Label("Rösterei", image: "beans")
                //                } else {
                //                }
                //
                Text(model.hood.rawValue)
                    .foregroundColor(Color("Olive10"))
                Spacer()
                Text(distance)
                Image(systemName: "chevron.forward")
            }
            .font(.system(.body, design: .default))
            .foregroundColor(.white)
            .padding(2)
            Text(model.name)
                .bold()
                .font(.system(.title2, design: .default))
                .foregroundColor(.white)
            FeatureDisplayView(features: model.features)
        }
        .padding()
        .background(Color("Olive3"))
        .frame(height: 125)
        .cornerRadius(16)
    }
}
