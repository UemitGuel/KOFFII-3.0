//
//  Top3View.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 26.09.20.
//

import SwiftUI

struct Top3View: View {
    
    @EnvironmentObject var store: LocationStore
    
    var cafe1: Cafe
    var cafe2: Cafe
    var cafe3: Cafe
    
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
            .navigationTitle("Ümit´t Top 3")
        }
    }
}

struct Top3View_Previews: PreviewProvider {
    static var previews: some View {
        Top3View(cafe1: cafeData[38], cafe2: cafeData[26], cafe3: cafeData[3])
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
