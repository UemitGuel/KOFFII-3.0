//
//  CoffeeView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeView: View {
    
    @State var needWifi = false
    @State var needFood = false
    @State var needVegan = false
    @State var needPlug = false
    
    var body: some View {
        ScrollView {
            FilterView(needWifi: $needWifi, needFood: $needFood, needVegan: $needVegan, needPlug: $needPlug)
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
 
