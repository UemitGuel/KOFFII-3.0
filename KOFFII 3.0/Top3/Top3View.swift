//
//  Top3View.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 26.09.20.
//

import SwiftUI

struct Top3View: View {
        
    var cafe1: CafeViewModel
    var cafe2: CafeViewModel
    var cafe3: CafeViewModel
    
    var body: some View {
        ScrollView {
            NavigationLink(
                destination: CafeDetailView(cafe: cafe1)) {
                DiscoverItem(cafe: cafe1)
            }
            NavigationLink(
                destination: CafeDetailView(cafe: cafe2)) {
                DiscoverItem(cafe: cafe2)
            }
            NavigationLink(
                destination: CafeDetailView(cafe: cafe3)) {
                DiscoverItem(cafe: cafe3)
            }
            .navigationTitle("Ümit´s Top 3")
        }
        .padding(.horizontal)
    }
}

struct NotesView: View {
    
    var cafe: Cafe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(cafe.notes[0])
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.primary)
            Text(cafe.notes[1])
                .font(.system(.subheadline, design: .rounded))
                .foregroundColor(.primary).opacity(0.8)
            
            Spacer()
        }
        .padding(.top, 32)
    }
}
