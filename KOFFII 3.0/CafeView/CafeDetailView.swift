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
        
    @State var regionVM = RegionStore.shared.region
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                Map(coordinateRegion: $regionVM, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: [cafe]) { item in
                    MapMarker(coordinate: item.coordinates)
                }
                .frame(height: geo.size.height*0.22, alignment: .center)
                VStack(alignment: .leading) {
                    Text(cafe.name)
                        .font(.system(.headline, design: .rounded))
                    Text("\(cafe.hood.rawValue)")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                    Text(LocationStore.shared.getDistanceAsString(cafeLocation: cafe.location))
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                    FeatureDisplayView(cafe: cafe)
                    GoogleMapsButton(cafe: cafe)
                        .padding(.top)
                    Divider()
                    HStack {
                        Image(cafe.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geo.size.height*0.25)
                            .cornerRadius(16)
                        Spacer()
                        VStack(alignment: .trailing,spacing: 2) {
                            Text("Öffnungszeiten")
                                .font(.system(.headline, design: .rounded))
                                .padding(.bottom, 2)
                            VStack(alignment: .leading) {
                                WeekdayHours(cafe: cafe, hoursIndex: 0, workday: "Mo")
                                WeekdayHours(cafe: cafe, hoursIndex: 1, workday: "Di")
                                WeekdayHours(cafe: cafe, hoursIndex: 2, workday: "Mi")
                                WeekdayHours(cafe: cafe, hoursIndex: 3, workday: "Do")
                                WeekdayHours(cafe: cafe, hoursIndex: 4, workday: "Fr")
                                WeekdayHours(cafe: cafe, hoursIndex: 5, workday: "Sa")
                                WeekdayHours(cafe: cafe, hoursIndex: 6, workday: "So")
                            }
                        }
                        .frame(width: geo.size.width*0.5)
                    }
                }
                .padding()
                if (!cafe.notes.isEmpty) {
                    Divider()
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ümit´s Notizen")
                            .font(.system(.headline, design: .rounded))
                            .padding(.bottom, 4)
                        Text(cafe.notes[1])
                        .padding(.bottom)
                        
                    }
                    .padding()
                }
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
    
}


struct CafeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CafeDetailView(cafe: cafeData[0])
        }
        .preferredColorScheme(.dark)
    }
}

struct WeekdayHours: View {
    
    var cafe: Cafe
    var hoursIndex: Int
    var workday: String
    
    var body: some View {
        HStack {
            Text("\(workday):")
                .frame(width:36,alignment: .leading)
            Text("\(cafe.hours?[hoursIndex].start ?? "") - \(cafe.hours?[hoursIndex].end ?? "")")
        }
        .font(.system(.callout, design: .rounded))
    }
}
