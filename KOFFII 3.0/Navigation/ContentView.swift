//
//  ContentView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 14.05.21.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            TabBar()
        } else {
            SideBar()
        }
        #else
        SideBar()
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
