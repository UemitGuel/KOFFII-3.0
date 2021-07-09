//
//  CoffeeItem.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CoffeeListItem: View {
    
    var model: CoffeeDetailViewModel
    
    init(coffee: Coffee) {
        self.model = CoffeeDetailViewModel(coffee: coffee)
    }
        
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                if model.isRoastery {
                    Label("Rösterei", image: "beans")
                } else {
                    FeatureDisplayView(cafe: model.coffee)
                }
                Spacer()
                Text(model.distance)
                Image(systemName: "chevron.forward")
            }
            .font(.system(.body, design: .rounded))
            .foregroundColor(.secondary)
            .padding([.horizontal, .top])
            Spacer()
            VStack(alignment: .leading) {
                Text(model.name)
                    .bold()
                    .font(.system(.title, design: .rounded))
                    .foregroundColor(.white)
                Text(model.hood)
                    .foregroundColor(Color(.secondaryLabel))
                    .font(.system(.body, design: .rounded))
            }
            .padding([.horizontal, .bottom])
        }
        .background(Color(.secondarySystemBackground))
        .frame(height: 125)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}
