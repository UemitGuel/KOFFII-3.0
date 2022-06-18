//
//  DiscoverItem.swift
//  KOFFII CGN 2.0
//
//  Created by Gül, Ümit on 21.12.20.
//

import SwiftUI

struct DiscoverItem: View {
    
    var cafe: NewCoffeeModel
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: cafe.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
            }
            .frame(height: 230)
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
                HStack(alignment: .bottom) {
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundColor(.accentColor)
                }
                .font(.system(.body, design: .default))
                .foregroundColor(.secondary)
            }
            .foregroundColor(Color(.label))
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}
