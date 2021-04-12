//
//  CoffeeList.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeList: View {
    
    @EnvironmentObject var store: LocationStore

    @Binding var cafeListFiltered: [Cafe]
    
    var cafeListFilteredrrr: [Cafe] {
        cafeListFiltered.sort { store.getDistance(cafeLocation: $0.location) < store.getDistance(cafeLocation: $1.location) }
        return cafeListFiltered
    }
    
    var body: some View {
            ForEach(cafeListFiltered, id: \.name) { item in
                NavigationLink(
                    destination: CafeDetailView(cafe: item),
                    label: {
                        VStack {
                            CafeItem(cafe: item)
                            Divider()
                                .padding(.bottom, 8)
                            
                        }
                        .padding(.horizontal)
                    })
            }
        
    }
}
