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
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(Color("Olive10"))
                Spacer()
                Text(model.distance)
                Image(systemName: "chevron.forward")
            }
            .font(.system(.body, design: .rounded))
            .foregroundColor(.white)
            Text(model.name)
                .bold()
                .font(.system(.title, design: .rounded))
                .foregroundColor(.white)
            FeatureDisplayView(cafe: model.coffee)
        }
        .padding()
        .background(Color("Olive3"))
        .frame(height: 125)
        .cornerRadius(16)
    }
}
