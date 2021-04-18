//
//  CoffeeList.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeList: View {
    var cafeListFiltered: [CafeViewModel]
    
    var body: some View {
            ForEach(cafeListFiltered, id: \.name) { item in
                NavigationLink(
                    destination: CafeDetailView(cafe: item),
                    label: {
                        CafeItem(cafe: item)
                    })
            }
        
    }
}
