//
//  DiscoverItem.swift
//  KOFFII CGN 2.0
//
//  Created by Gül, Ümit on 21.12.20.
//

import SwiftUI

struct DiscoverItem: View {
    
    var cafe: CoffeeModel
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                AsyncImage(url: cafe.imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image(systemName: "photo")
                }
                .frame(height: 230)
                VStack {
                    HStack(alignment: .bottom) {
                        Spacer()
                        
                        HStack {
                            Text("Mehr")
                            Image(systemName: "chevron.forward")
                        }
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color("Olive3"))
                        .cornerRadius(16)

                    }
                    .foregroundColor(.secondary)
                    .padding()
                    Spacer()
                }
            }
            bar.background(Color("Olive3"))
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .padding(.horizontal)
    }
    
    var bar: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(cafe.hood)".capitalized)
                    .font(.subheadline)
                    .foregroundColor(Color("Olive10"))
                Text("\(cafe.name)")
                    .font(.title2)
                    .bold()
                Text(cafe.note ?? "")
                    .font(.subheadline)
                    .lineLimit(5)
                    .multilineTextAlignment(.leading)
                DiscoverFeatureView(features: cafe.features)
                    .padding(.vertical, 4)
            }
            .foregroundColor(Color(.label))
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}
