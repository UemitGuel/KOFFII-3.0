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
                ScrollView {
                    DiscoverItem(cafe: discoverCafes[0])
                        .padding(.bottom)
                    InformationListItem(info: informationData[2])
                        .padding(.bottom)
                    CoffeeListItem(coffee: roasteryData[0])
                        .padding(.bottom)
                    DiscoverItem(cafe: discoverCafes[1])
                        .padding(.bottom)
                    DiscoverItem(cafe: discoverCafes[2])
                        .padding(.bottom)
                        .navigationTitle("Empfehlungen")
                }
            }
            .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                guard let incomingURL = userActivity.webpageURL,
                      let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true)
                else {
                    return
                }
                
            }
        }
    }
}

