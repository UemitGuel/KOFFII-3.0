//
//  TabBar.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 22.09.20.
//

import SwiftUI

struct TabBar: View {
    
    @State private var selection: Tab = .discovery

    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                DiscoveryView()
            }
            .tabItem {
                Label("Entdecken", systemImage: "heart.text.square")
            }
            .tag(Tab.discovery)
            
            NavigationView {
                CoffeeView()
            }
            .tabItem {
                Label("Liste", systemImage: "list.dash")
            }
            .tag(Tab.list)

            NavigationView {
                AllCafesMapView()
            }
            .tabItem {
                Label("Karte", systemImage: "map")
            }
            .tag(Tab.map)
            
            NavigationView {
                InformationView()
            }
            .tabItem {
                Label("Zubereitung", systemImage: "book")
            }
            .tag(Tab.method)
        }
    }
}

// MARK: - Tab

extension TabBar {
    
    enum Tab {
        case discovery
        case list
        case map
        case method
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}
