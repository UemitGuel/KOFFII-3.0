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
                Image(systemName: "wifi")
            }

            bar.background(Color("Olive2"))
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .padding(.horizontal)
    }
    
    var bar: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(cafe.hood)".capitalized)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(Color("Olive10"))
                Text("\(cafe.name)")
                    .font(.system(.title, design: .rounded))
                    .bold()
                Text(cafe.note ?? "")
                    .font(.system(.subheadline, design: .rounded))
                    .multilineTextAlignment(.leading)
                HStack(alignment: .bottom) {
                    Spacer()
                    Image(systemName: "chevron.forward")
                }
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
            }
            .foregroundColor(Color(.label))
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}
