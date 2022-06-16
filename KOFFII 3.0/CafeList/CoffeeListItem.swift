//
//  CoffeeItem.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CoffeeListItem: View {
    
    var model: CoffeeDetailViewModel
    
    init(coffee: NewCoffeeModel) {
        self.model = CoffeeDetailViewModel(coffee: coffee)
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                //                if model.isRoastery {
                //                    Label("Rösterei", image: "beans")
                //                } else {
                //                }
                //
                Text(model.hood)
                    .foregroundColor(Color("Olive10"))
                Spacer()
                Text(model.distance)
                Image(systemName: "chevron.forward")
            }
            .font(.system(.body, design: .default))
            .foregroundColor(.white)
            .padding(2)
            Text(model.name)
                .bold()
                .font(.system(.title2, design: .default))
                .foregroundColor(.white)
            FeatureDisplayView(cafe: model.coffee)
        }
        .padding()
        .background(Color("Olive3"))
        .frame(height: 125)
        .cornerRadius(16)
    }
}
