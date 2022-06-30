import SwiftUI

struct CoffeeView: View {
    
    @EnvironmentObject var model: CoffeeListViewModel
    @EnvironmentObject var weatherStore: WeatherStore
    
    @State private var isPresented = false
    
    var body: some View {
        ScrollView {
            if model.filteredCoffeePlaces.isEmpty {
                HStack(alignment: .center) {
                    Spacer()
                    VStack(alignment: .center) {
                        Spacer()
                        Text("Keine Suchergebnisse gefunden")
                            .padding(.top)
                        Spacer()
                    }
                    Spacer()
                }
            } else {
                ForEach(model.filteredCoffeePlaces, id: \.name) { coffee in
                    NavigationLink(
                        destination: CoffeeDetailView(model: coffee),
                        label: {
                            CoffeeListItem(model: coffee)
                        })
                }
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
        .searchable(text: $model.searchQuery, placement: .navigationBarDrawer(displayMode: .always),
                    prompt: model.filteredCoffeePlaces.isEmpty ? Text("Keine Suchergebnisse") : nil
        )
    }
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoffeeView()
        }
    }
}

