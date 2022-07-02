import SwiftUI
import CoreLocation

struct CoffeeListItem: View {

    @StateObject var locationManager = LocationManager()
    var model: CoffeeModel

    var distance: String {
        guard let lastLocation = locationManager.lastLocation,
              locationManager.locationStatus == .authorizedAlways ||
                locationManager.locationStatus == .authorizedWhenInUse else { return "" }
        return CoordinatesHelper.shared.getDistanceFor(model, userLocation: lastLocation) ?? "0"
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                //                if model.isRoastery {
                //                    Label("Rösterei", image: "beans")
                //                } else {
                //                }
                //
                Text(model.hood.rawValue)
                    .foregroundColor(Color("Olive10"))
                Spacer()
                Text(distance)
                Image(systemName: "chevron.forward")
            }
            .font(.system(.body, design: .default))
            .foregroundColor(.white)
            .padding(2)
            Text(model.name)
                .bold()
                .font(.system(.title2, design: .default))
                .foregroundColor(.white)
            FeatureDisplayView(features: model.features)
        }
        .padding()
        .background(Color("Olive3"))
        .frame(height: 125)
        .cornerRadius(16)
    }
}
