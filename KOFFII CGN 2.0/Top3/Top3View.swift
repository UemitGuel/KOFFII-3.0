//
//  Top3View.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 26.09.20.
//

import SwiftUI

struct Top3View: View {
    
    var body: some View {
        Geometr {
            ScrollView(showsIndicators: false) {
                SpotlightItem(cafe: cafeData[4])
                SpotlightItem(cafe: cafeData[5])
                SpotlightItem(cafe: cafeData[6])
            }
            .padding()
            .navigationTitle("Ümit´s Top 3")
        }
        
    }
}

struct Top3View_Previews: PreviewProvider {
    static var previews: some View {
        Top3View()
    }
}

struct SpotlightItem: View {
    
    @EnvironmentObject var store: LocationStore
    
    var cafe: Cafe
    
    var body: some View {
        CafeItem(cafe:cafe)
    }
}
