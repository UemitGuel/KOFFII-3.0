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
        ZStack(alignment: .bottom) {
            info.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
            bar.background(Color(.secondarySystemBackground))
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 5)
        .padding()
        
    }
    
    var bar: some View {
        HStack {
            Text("\(info.title)")
                .font(.system(.headline, design: .rounded))
                .bold()
                .foregroundColor(Color(.label))
            Spacer()
        }
        .padding()
    }
}

struct InformationListItem_Previews: PreviewProvider {
    static var previews: some View {
        InformationListItem(info: informationData[0])
    }
}
