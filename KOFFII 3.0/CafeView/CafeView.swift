//
//  CoffeeView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeView: View {
    
    @ObservedObject var model = CafeListViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
//            FilterView(needWifi: model.needWifi, needFood: model.needFood, needVegan: model.needVegan, needPlug: model.needPlug)
//                .padding(.leading)
            Divider()
//            CafeList(cafeListFiltered: model.cafeList)
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
 
