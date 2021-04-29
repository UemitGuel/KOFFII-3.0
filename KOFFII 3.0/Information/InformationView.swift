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
                    destination: InformationDetailCoordinator(info: info),
                    label: {
                        InformationListItem(info: info)
                            .padding(.bottom)
                    })
            }
        }
        .padding(.horizontal)
        .navigationTitle("Cafes& Rösterein")
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
