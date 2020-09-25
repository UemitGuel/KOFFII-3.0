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
            
            NavigationView {
                Text("Info")
            }
            .tabItem {
                Label("Info", systemImage: "circle")
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
