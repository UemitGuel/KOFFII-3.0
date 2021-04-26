//
//  Top3View.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 26.09.20.
//

import SwiftUI

struct DiscoveryView: View {
        
    var cafe1: DiscoveryCafeViewModel
    var cafe2: DiscoveryCafeViewModel
    var cafe3: DiscoveryCafeViewModel
    
    var body: some View {
        ScrollView {
            NavigationLink(
                destination: CoffeeDetailView(coffee: cafe1.cafe)) {
                DiscoverItem(cafe: cafe1)
            }
            .padding(.vertical)
            NavigationLink(
                destination: CoffeeDetailView(coffee: cafe2.cafe)) {
                DiscoverItem(cafe: cafe2)
            }
            .padding(.bottom)
            NavigationLink(
                destination: CoffeeDetailView(coffee: roasteryData[0])) {
                CoffeeListItem(coffee: roasteryData[0])
            }
            .padding(.bottom)
            NavigationLink(
                destination: CoffeeDetailView(coffee: cafe3.cafe)) {
                DiscoverItem(cafe: cafe3)
            }
            .padding(.bottom)
            .navigationTitle("Empfehlungen")
        }
    }
}
