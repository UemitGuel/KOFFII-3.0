//
//  Top3View.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 26.09.20.
//

import SwiftUI

struct Top3View: View {
        
    var cafe1: DiscoveryCafeViewModel
    var cafe2: DiscoveryCafeViewModel
    var cafe3: DiscoveryCafeViewModel
    
    var body: some View {
        ScrollView {
            NavigationLink(
                destination: CoffeeDetailView(coffee: cafe1.cafe)) {
                DiscoverItem(cafe: cafe1)
            }
            NavigationLink(
                destination: CoffeeDetailView(coffee: cafe2.cafe)) {
                DiscoverItem(cafe: cafe2)
            }
            NavigationLink(
                destination: CoffeeDetailView(coffee: cafe3.cafe)) {
                DiscoverItem(cafe: cafe3)
            }
            .navigationTitle("Ümit´s Top 3")
        }
    }
}

struct NotesView: View {
    
    var cafe: DiscoveryCafeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(cafe.notesTitle)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.primary)
            Text(cafe.notesBody)
                .font(.system(.subheadline, design: .rounded))
                .foregroundColor(.primary).opacity(0.8)
            Spacer()
        }
        .padding(.top, 32)
    }
}
