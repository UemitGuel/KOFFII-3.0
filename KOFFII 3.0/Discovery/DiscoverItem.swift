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
                bar.background(Color("Olive2"))
            }
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding(.horizontal)
        }
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
                Text(cafe.notesBody)
                    .font(.system(.subheadline, design: .rounded))
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
