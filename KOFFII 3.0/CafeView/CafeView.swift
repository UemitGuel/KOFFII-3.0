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
    
    var cafeListFiltered: [Cafe] {
        let cafeListFiltered = getfilteredCafeList()
        return cafeListFiltered
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            FilterView(needWifi: $needWifi, needFood: $needFood, needVegan: $needVegan, needPlug: $needPlug)
                .padding(.leading)
            Divider()
            CafeList(cafeListFiltered: cafeListFiltered)
        }
        .navigationTitle("KOFFII CGN")
    }
    
}

extension CafeView {
    
    private func getfilteredCafeList() -> [Cafe] {
        var cafeList = cafeData
        if needWifi {
            cafeList = cafeList.filter { $0.hasWifi }
        }
        if needFood {
            cafeList = cafeList.filter { $0.hasFood }
        }
        if needVegan {
            cafeList = cafeList.filter { $0.hasVegan }
        }
        if needPlug {
            cafeList = cafeList.filter { $0.hasPlug }
        }
        cafeList.sort { LocationStore.shared.getDistance(cafeLocation: $0.location) < LocationStore.shared.getDistance(cafeLocation: $1.location) }
        return cafeList
    }
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CafeView()
        }
    }
}
 
