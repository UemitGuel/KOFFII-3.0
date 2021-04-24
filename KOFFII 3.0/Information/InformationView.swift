//
//  InformationView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 24.04.21.
//

import SwiftUI

struct InformationView: View {
    
    var model = informationData.sorted()
    
    var body: some View {
        ScrollView {
            ForEach(informationData, id: \.title) { info in
                NavigationLink(
                    destination: Text("hi"),
                    label: {
                        Text(info.title)
                    })
                
            }
            .padding(.bottom)
        }
        .navigationTitle("Cafes& Rösterein")
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
