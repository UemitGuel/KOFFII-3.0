//
//  GoogleMapsButton.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI

struct GoogleMapsButton: View {
    
    var cafe: CafeDetailViewModel
    
    init(cafe: Cafe) {
        self.cafe = CafeDetailViewModel(cafe: cafe)
    }
    
    var googleMapsUrl: URL {
        let urlEncoded = cafe.locationURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        return URL(string: urlEncoded)!
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Spacer()
            Link("In Google Maps öffnen", destination: googleMapsUrl)
            Spacer()
        }
        .foregroundColor(Color(.systemBackground))
        .padding()
        .background(Color(.systemOrange))
        .cornerRadius(16)
        
        .padding(.horizontal)
        .padding(.bottom)
    }
}
