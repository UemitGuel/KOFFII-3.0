//
//  RoasteryItem.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 23.04.21.
//

import SwiftUI

struct RoasteryItem: View {
    
    var roastery: RoasteryViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image("beans")
                Spacer()
                Text(roastery.distance)
                Image(systemName: "chevron.forward")
            }
            .font(.system(.body, design: .rounded))
            .foregroundColor(.secondary)
            .padding([.horizontal, .top])
            Spacer()
            VStack(alignment: .leading) {
                Text(roastery.name)
                    .bold()
                    .font(.system(.title, design: .rounded))
                Text(roastery.hood)
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

struct RoasteryItem_Previews: PreviewProvider {
    static var previews: some View {
        RoasteryItem(roastery: RoasteryViewModel(roastery: roasteryData[0]))
    }
}
