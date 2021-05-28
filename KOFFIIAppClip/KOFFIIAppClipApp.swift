//
//  KOFFIIAppClipApp.swift
//  KOFFIIAppClip
//
//  Created by Gül, Ümit on 30.12.20.
//

import SwiftUI

@main
struct KOFFIIAppClipApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(WeatherStore())
                    .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                        //TODO
                    }
            }
        }
    }
}

