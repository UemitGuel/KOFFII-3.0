//
//  CoffeeList.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeList: View {
    var cafeListFiltered: [Cafe]
    
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

struct CoffeeList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CafeList(cafeListFiltered: cafeData)
            CafeList(cafeListFiltered: cafeData)
                .preferredColorScheme(.dark)
        }
    }
}
