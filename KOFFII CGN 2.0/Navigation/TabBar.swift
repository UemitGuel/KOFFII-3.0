//
//  TabBar.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 22.09.20.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationView {
                Top3View(cafe1: topThreeOfTheMonth[0], cafe2: topThreeOfTheMonth[1], cafe3: topThreeOfTheMonth[2])
            }
            .tabItem {
                Label("Top 3", systemImage: "seal")
            }
            NavigationView {
                CafeView()
            }
            .tabItem {
                Label("Cafes", systemImage: "square.grid.2x2")
            }
            
            NavigationView {
                AllCafesMapView()
            }
            .tabItem {
                Label("Map", systemImage: "rectangle")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}
