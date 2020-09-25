//
//  ContentView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @ViewBuilder
    
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            TabBar().environmentObject(LocationStore()).environmentObject(RegionStore()).environmentObject(MapViewStore())
        } else {
            Sidebar()
        }
        #else
        Sidebar()
            .frame(minWidth: 1000, minHeight: 600)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
