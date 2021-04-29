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
        HStack(alignment: .top) {
            Spacer()
            Link("In Google Maps öffnen", destination: googleMapsUrl)
            Spacer()
        }
        .foregroundColor(.black)
        .padding()
        .background(Color.accentColor)
        .cornerRadius(16)
        .padding(.bottom)
    }
}
