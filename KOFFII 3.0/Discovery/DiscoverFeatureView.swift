import SwiftUI

struct DiscoverFeatureView: View {

    let features: [AvailableFeature]

    var body: some View {
        VStack(spacing: 16) {
            DiscoverViewFeatureItem(feature: features[0])
            HStack(spacing: 8) {
                DiscoverViewFeatureItem(feature: features[1])
                DiscoverViewFeatureItem(feature: features[2])
                DiscoverViewFeatureItem(feature: features[3])
            }
        }
    }
}

struct DiscoverViewFeatureItem: View {

    let feature: AvailableFeature

    var body: some View {
        HStack(spacing: 4) {
            Text(feature.feature.title)
            feature.feature.icon
            if feature.feature == .wifi, let download = feature.wifiDownload, let upload = feature.wifiUpload {
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    Text(download)
                    Image(systemName: "square.and.arrow.down")
                }
                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    Text(upload)
                    Image(systemName: "square.and.arrow.up")
                }
                Text("Mbps")
            }
        }
        .foregroundColor(feature.isAvailable ? Color(.white) : Color(.secondaryLabel).opacity(0.7))
        .padding(.vertical)
        .padding(.horizontal, feature.feature == .wifi ? 16 : 0) 
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.white, lineWidth: 0.5)
        )
    }
}
