//
//  DiscoverItem.swift
//  KOFFII CGN 2.0
//
//  Created by Gül, Ümit on 21.12.20.
//

import SwiftUI

struct DiscoverItem: View {
    
    var cafe: CoffeeDetailViewModel
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                Image(cafe.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                bar.background(Color(.secondarySystemBackground))
            }
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding(.horizontal)
        }
    }
    
    var bar: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(cafe.name) - \(cafe.notesTitle)")
                    .font(.system(.headline, design: .rounded))
                    .bold()
                Text(cafe.notesBody)
                    .font(.system(.subheadline, design: .rounded))
                HStack(alignment: .bottom) {
                    Spacer()
                    Image(systemName: "chevron.forward")
                }
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
                .padding(.leading)
            }
            .foregroundColor(Color(.label))
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}
