//
//  GoogleMapsButton.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI

struct GoogleMapsButton: View {
    
    var locationURL: String
    
    var googleMapsUrl: URL {
        let urlEncoded = locationURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        return URL(string: urlEncoded)!
    }
    
    var body: some View {
        Link(destination: googleMapsUrl) {
            HStack(alignment: .top) {
                Spacer()
                Text("In Google Maps öffnen")
                Spacer()
            }
            .foregroundColor(.black)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(16)
        }
    }
}
