//
//  SideBar.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 14.05.21.
//

import SwiftUI

struct SideBar: View {
    
    enum NavigationItem {
        case discovery
        case list
        case map
        case method
    }
    
    @State private var selection: NavigationItem? = .discovery

    var sidebar: some View {
        List(selection: $selection) {
            NavigationLink(destination: DiscoveryView(), tag: NavigationItem.discovery, selection: $selection) {
                Label("Entdecken", systemImage: "heart.text.square")
            }
            .tag(NavigationItem.discovery)
            
            NavigationLink(destination: CoffeeView(), tag: NavigationItem.list, selection: $selection) {
                Label("Liste", systemImage: "list.dash")
            }
            .tag(NavigationItem.list)
        
            NavigationLink(destination: AllCafesMapView(), tag: NavigationItem.map, selection: $selection) {
                Label("Karte", systemImage: "map")
            }
            .tag(NavigationItem.map)
            
            NavigationLink(destination: InformationView(), tag: NavigationItem.method, selection: $selection) {
                Label("Zubereitung", systemImage: "book")
            }
            .tag(NavigationItem.method)
        }
        .listStyle(SidebarListStyle())
    }

    var body: some View {
        NavigationView {
            sidebar
            
            Text("Select a category")
                .foregroundColor(.secondary)
        }
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
