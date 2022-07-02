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
            MapView(coffeeList: $model.filteredCoffeeList, centerCoordinate: $centerCoordinate)
                .sheet(isPresented: $mapViewStore.showDetails) {
                    CoffeeDetailView(model: mapViewStore.chosenCafe)
                }
                .navigationTitle("Karte")
                .navigationBarTitleDisplayMode(.inline)
                .addWeatherToolbarItem(with: weatherStore.model)
            .background(Color("Olive1"))
        }
    }
}
