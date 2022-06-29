//
//  KOFFII_CGN_2_0App.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

@main
struct KOFFII_3_0App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MapViewStore())
                .environmentObject(CoffeeListViewModel())
                .environmentObject(WeatherStore())
                .environmentObject(LocationStore())
        }
    }
}
