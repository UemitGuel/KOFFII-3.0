//
//  InformationListItem.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 25.04.21.
//

import SwiftUI

struct InformationListItem: View {
    
    var info: Information
    
    var body: some View {
        VStack(spacing: 0) {
            info.image
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(info.title)
                        .bold()
                        .font(.system(.title, design: .rounded))
                        .foregroundColor(.white)
                    Text(info.isMethod ? "Zubereitung" : "Wissen")
                        .foregroundColor(Color("Olive10"))
                        .font(.system(.body, design: .rounded))
                }
                Spacer()
                HStack {
                    Image(systemName: "chevron.forward")
                        .foregroundColor(.white)
                }
                .font(.system(.body, design: .rounded))
            }
            .padding()
            .background(Color("Olive3"))
        }
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

struct InformationListItem_Previews: PreviewProvider {
    static var previews: some View {
        InformationListItem(info: informationData[0])
    }
}
