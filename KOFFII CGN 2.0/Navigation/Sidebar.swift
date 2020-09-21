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
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Image(systemName: "person.crop.circle")
                }
            }
            #else
            content
                .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
            #endif
        }
    }
    
    var content: some View {
        List {
            Label("Entdecken", systemImage: "heart.text.square")
            Label("Cafes", systemImage: "list.dash")
            Label("Karte", systemImage: "map")
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
