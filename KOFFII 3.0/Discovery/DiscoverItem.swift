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
                    .frame(height: 230)
            } placeholder: {
                Image("Placeholder")
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
                    .font(.system(.subheadline, design: .default))
                    .foregroundColor(Color("Olive10"))
                Text("\(cafe.name)")
                    .font(.system(.title2, design: .default))
                    .bold()
                Text(cafe.note ?? "")
                    .font(.system(.subheadline, design: .default))
                    .multilineTextAlignment(.leading)
                DiscoverFeatureView(features: cafe.features)
                    .padding(.vertical, 2)
                HStack(alignment: .bottom) {
                    Spacer()
                    Image(systemName: "chevron.forward")
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
