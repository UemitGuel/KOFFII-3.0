//
//  Sidebar.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            #if os(iOS)
            content
                .navigationTitle("KOFFII CGN")
            #else
            content
                .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
            #endif
        }
    }
    
    var content: some View {
        List {
            NavigationLink(destination:                 Top3View(cafe1: cafeData[38], cafe2: cafeData[3], cafe3: cafeData[48])
            ) {
                Label("Top 3", systemImage: "seal")
            }
            NavigationLink(destination:                 CafeView()
            ) {
                Label("Cafes", systemImage: "square.grid.2x2")
            }
            NavigationLink(destination:                 AllCafesMapView()
            ) {
                Label("Map", systemImage: "rectangle")
            }
            
            
        }
        .listStyle(SidebarListStyle())
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Sidebar()
            Sidebar()
                .preferredColorScheme(.dark)
        }
    }
}
