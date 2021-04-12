//
//  CoffeeView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI
import Combine

struct CafeView: View {
    
    @ObservedObject var cafeStore = CafeStore()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            FilterView(needWifi: $cafeStore.needWifi, needFood: $cafeStore.needFood, needVegan: $cafeStore.needVegan, needPlug: $cafeStore.needPlug)
            Divider()
            CafeList(cafeListFiltered: cafeStore.getfilteredCafeList() )
                .padding(.top)
        }
        .padding(.horizontal)
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
 
