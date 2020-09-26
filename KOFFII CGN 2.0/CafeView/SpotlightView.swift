//
//  SpotlightView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI

struct SpotlightView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ümit´s Empfehlungen")
                .font(.headline)
            TabView {
                SpotlightItem(cafe: cafeData[0])
                SpotlightItem(cafe: cafeData[1])
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .frame(height: 150)
        }
        
    }
}

struct SpotlightView_Previews: PreviewProvider {
    static var previews: some View {
        SpotlightView()
    }
}
