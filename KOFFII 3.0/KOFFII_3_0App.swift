import SwiftUI

@main
struct KOFFII_3_0App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MapViewStore())
                .environmentObject(CoffeeListViewModel())
                .environmentObject(WeatherStore())
                .environmentObject(InformationController())
        }
    }
}
