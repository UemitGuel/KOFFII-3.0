//
//  CoffeeList.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CoffeeList: View {
    @ViewBuilder
    
    var body: some View {
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    
    var content: some View {
        List(0 ..< 5) { item in
            CoffeeRow()
        }
        .navigationTitle("KOFFII CGN")
    }
}

struct CoffeeList_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeList()
    }
}
