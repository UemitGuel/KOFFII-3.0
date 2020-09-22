//
//  CoffeeView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeView: View {
    
    @EnvironmentObject var store: FilterStore
    
    var body: some View {
        ScrollView {
            FilterButtons()
            CafeList()
        }
        .navigationTitle("KOFFII CGN")
    }
    
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CafeView()
        }
    }
}
 
