import SwiftUI
import MapKit

struct AllCafesMapView: View {
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @StateObject var locationManager = LocationManager()
    
    @EnvironmentObject var mapViewStore: MapViewStore
    @EnvironmentObject var model: CoffeeListViewModel
    @EnvironmentObject var weatherStore: WeatherStore
    
    @State private var isPresented = false

    var body: some View {
        ZStack {
            MapView(coffeeList: $model.newCoffeeList, centerCoordinate: $centerCoordinate)
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
                .sheet(isPresented: $mapViewStore.showDetails) {
                    CoffeeDetailView(model: mapViewStore.chosenCafe)
                }
                .sheet(isPresented: $isPresented) {
                    FilterFormView()
                }
                .navigationTitle("Karte")
                .addWeatherToolbarItem(with: weatherStore.model)
            .background(Color("Olive1"))
        }
    }
}
