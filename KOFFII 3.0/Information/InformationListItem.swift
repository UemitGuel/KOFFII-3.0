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
                .clipped()
            HStack {
                Text(info.title)
                    .bold()
                    .font(.system(.title, design: .rounded))
                Spacer()
                Image(systemName: "chevron.forward")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
        }
        .cornerRadius(16)

    }
}

struct InformationListItem_Previews: PreviewProvider {
    static var previews: some View {
        InformationListItem(info: informationData[0])
    }
}
