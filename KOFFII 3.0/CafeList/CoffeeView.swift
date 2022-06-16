//
//  CoffeeView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CoffeeView: View {
    
    @EnvironmentObject var model: CoffeeListViewModel
    @EnvironmentObject var weatherStore: WeatherStore
    
    @State private var isPresented = false
    
    var body: some View {
        ScrollView {
            ForEach(model.newCoffeeList, id: \.name) { coffee in
                NavigationLink(
                    destination: CoffeeDetailView(model: coffee),
                    label: {
                        CoffeeListItem(model: coffee)
                    })
                
            }
        }
        .padding(.horizontal)
        .navigationTitle("Cafes& Rösterein")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { isPresented.toggle() } ) {
                    HStack(spacing: 4) {
                        Text("FILTER")
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                    .font(.system(.headline, design: .default))
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            FilterFormView()
        }
        .addWeatherToolbarItem(with: weatherStore.model)
        .background(Color("Olive1"))
    }
    
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoffeeView()
        }
    }
}

