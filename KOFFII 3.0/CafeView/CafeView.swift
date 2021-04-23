//
//  CoffeeView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeView: View {
    
    @EnvironmentObject var model: CafeListViewModel

    @State private var isPresented = false

    var body: some View {
        ScrollView {
            ForEach(model.cafeList, id: \.name) { cafe in
                NavigationLink(
                    destination: CafeDetailView(cafe: cafe),
                    label: {
                        CafeItem(cafe: cafe)
                    })
                
            }
        }
        .navigationTitle("Cafes")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { isPresented.toggle() } ) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .imageScale(.large)
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            FilterFormView()
        }
        .padding(.bottom)
    }
    
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CafeView()
        }
    }
}

