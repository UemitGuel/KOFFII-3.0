//
//  CoffeeList.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeList: View {
    var cafeListFiltered: [Cafe]
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
        #else
        content
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]
    
    var content: some View {
            LazyVGrid(columns: columns, spacing: 32) {
                ForEach(cafeListFiltered, id: \.self) { item in
                    CafeItem(cafe: item)
                }
            }
            .padding(.horizontal)
            .animation(.spring())
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
