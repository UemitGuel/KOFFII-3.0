//
//  CafeDetailView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 23.09.20.
//

import SwiftUI
import MapKit

struct CafeDetailView: View {
    
    var cafe: Cafe
    
    var googleMapsUrl: URL {
        let urlEncoded = cafe.locationURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        return URL(string: urlEncoded)!
    }
    
    @ObservedObject var locationVM = LocationViewModel()
    @ObservedObject var regionVM = RegionViewModel()
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    @State var showModal = false
    
    var location: [Location] {
        Location.getLocation(name: cafe.name, coordinate: cafe.coordinates)
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                Map(coordinateRegion: $regionVM.region , interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: location) { item in
                    MapMarker(coordinate: item.coordinate)
                }
                .frame(height: geo.size.height*0.22, alignment: .center)
                
                VStack(alignment: .leading) {
                    Text(cafe.name)
                        .font(.system(.headline, design: .rounded))
                    Text("\(cafe.hood.rawValue) - 300m")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                    FeatureDisplayView(cafe: cafe)
                    
                    
                    HStack {
                        Spacer()
                        Link("In Google Maps öffnen", destination: googleMapsUrl)
                        Spacer()
                    }
                    .foregroundColor(Color(.systemBackground))
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(16)
                    
                    .padding(.horizontal)
                    .padding(.bottom)
                    Divider()
                    HStack {
                        if cafe.photo {
                            Image(cafe.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: geo.size.height*0.25)
                                .cornerRadius(16)
                        } else {
                            Text("in Arbeit :)")
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .background(Color.gray)
                        }
                        Spacer()
                        VStack(alignment: .trailing,spacing: 2) {
                            Text("Öffnungszeiten")
                                .font(.system(.headline, design: .rounded))
                                .padding(.bottom, 2)
                            Text("Montag: 8:00 - 20:00")
                                .font(.system(.callout, design: .rounded))
                            Text("Montag: 8:00 - 20:00")
                                .font(.system(.callout, design: .rounded))
                            Text("Montag: 8:00 - 20:00")
                                .font(.system(.callout, design: .rounded))
                            Text("Montag: 8:00 - 20:00")
                                .font(.system(.callout, design: .rounded))
                            Text("Montag: 8:00 - 20:00")
                                .font(.system(.callout, design: .rounded))
                            Text("Montag: 8:00 - 20:00")
                                .font(.system(.callout, design: .rounded))
                            Text("Montag: 8:00 - 20:00")
                                .font(.system(.callout, design: .rounded))
                        }
                    }
                    .padding(.vertical)
                    Divider()
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ümit´s Notizen")
                            .font(.system(.headline, design: .rounded))
                            .padding(.bottom, 4)
                        ForEach(0..<6) { item in
                            Label("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et", systemImage: "bubble.left")
                                .padding(.bottom)
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
                
                .sheet(isPresented: $showModal, content: {
                    Text("edelm")
                })
                
                .navigationBarTitle("", displayMode: .inline)
            }
        }
    }
}

struct CafeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CafeDetailView(cafe: cafeData[1])
        }
        .preferredColorScheme(.dark)
    }
}
