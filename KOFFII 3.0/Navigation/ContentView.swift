//
//  ContentView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 14.05.21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .discovery

    enum Tab {
        case discovery
        case list
        case map
        case method
    }

    var body: some View {
        TabView(selection: $selection) {
            NavigationStack {
                DiscoveryView()
            }
            .tabItem {
                Label("Entdecken", systemImage: "heart.text.square")
            }
            .tag(Tab.discovery)

            NavigationStack {
                CoffeeView()
            }
            .tabItem {
                Label("Liste", systemImage: "list.dash")
            }
            .tag(Tab.list)

            NavigationStack {
                AllCafesMapView()
            }
            .tabItem {
                Label("Karte", systemImage: "map")
            }
            .tag(Tab.map)

            NavigationStack {
                InformationView()
            }
            .tabItem {
                Label("Zubereitung", systemImage: "book")
            }
            .tag(Tab.method)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
