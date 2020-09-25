//
//  DismissButton.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI

struct DismissButton: View {
    
    @Binding var showsDetails: Bool
    
    var body: some View {
        Button(action: { showsDetails = false }) {
            Image(systemName: "xmark")
                .frame(width: 44, height: 44)
                .imageScale(.large)
                .background(Color.accentColor)
                .foregroundColor(Color(.systemBackground))
                .cornerRadius(20)
        }
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton(showsDetails: .constant(true))
    }
}
