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
            AsyncImage(url: info.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
            }
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(info.title)
                        .bold()
                        .font(.system(.title2, design: .default))
                        .foregroundColor(.white)
                    Text(info.isMethod ? "Zubereitung" : "Wissen")
                        .foregroundColor(Color("Olive10"))
                        .font(.system(.body, design: .default))
                }
                Spacer()
                HStack {
                    Image(systemName: "chevron.forward")
                        .foregroundColor(.white)
                }
                .font(.system(.body, design: .default))
            }
            .padding()
            .background(Color("Olive3"))
        }
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

