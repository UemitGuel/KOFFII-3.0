//
//  RoasteryView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 23.04.21.
//

import SwiftUI

struct RoasteryView: View {
    
    @ObservedObject var model = RoasteryListViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(model.roasteryList, id: \.name) { roastery in
                NavigationLink(
                    destination: Text("Geschafft"),
                    label: {
                        RoasteryItem(roastery: RoasteryViewModel(roastery: roastery))
                    })
                
            }
        }
        .navigationTitle("Rösterein")
        .padding(.bottom)
    }
}

struct RoasteryView_Previews: PreviewProvider {
    static var previews: some View {
        RoasteryView(model: RoasteryListViewModel())
    }
}
