//
//  CafeDetailView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 23.09.20.
//

import SwiftUI
import MapKit

struct CafeDetailView: View {
    
    var model: CafeDetailViewModel
    
    init(cafe: Cafe) {
        self.model = CafeDetailViewModel(cafe: cafe)
    }
        
    @State var regionVM = RegionStore.shared.region
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                Map(coordinateRegion: $regionVM, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: [model]) { item in
                    MapMarker(coordinate: item.coordinates)
                }
                .frame(height: geo.size.height*0.22, alignment: .center)
                VStack(alignment: .leading) {
                    HStack{
                        FeatureDisplayView(cafe: model.cafe)
                        Spacer()
                        Text(model.distance)
                    }
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.secondary)
                    .padding([.top])
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(model.name)
                            .bold()
                            .font(.system(.title, design: .rounded))
                        Text(model.hood)
                            .foregroundColor(Color(.secondaryLabel))
                            .font(.system(.body, design: .rounded))
                    }
                    .padding([.bottom])
                    GoogleMapsButton(cafe: model.cafe)
                        .padding(.top)
                    Divider()
                    HStack {
                        if model.hasImage {
                            Image(model.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: geo.size.height*0.25)
                                .cornerRadius(16)
                            Spacer()
                        }
                        VStack(alignment: model.hasImage ? .trailing : .leading, spacing: 2) {
                            Text("Öffnungszeiten")
                                .font(.system(.headline, design: .rounded))
                                .padding(.bottom, 2)
                            VStack(alignment: .leading) {
                                WeekdayHours(cafe: model.cafe, hoursIndex: 0, workday: "Mo")
                                WeekdayHours(cafe: model.cafe, hoursIndex: 1, workday: "Di")
                                WeekdayHours(cafe: model.cafe, hoursIndex: 2, workday: "Mi")
                                WeekdayHours(cafe: model.cafe, hoursIndex: 3, workday: "Do")
                                WeekdayHours(cafe: model.cafe, hoursIndex: 4, workday: "Fr")
                                WeekdayHours(cafe: model.cafe, hoursIndex: 5, workday: "Sa")
                                WeekdayHours(cafe: model.cafe, hoursIndex: 6, workday: "So")
                            }
                        }
                    }
                }
                .padding()
                if (model.hasNotes) {
                    Divider()
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ümit´s Notizen")
                            .font(.system(.headline, design: .rounded))
                            .padding(.bottom, 4)
                        Text(model.notesBody)
                        .padding(.bottom)

                    }
                    .padding()
                }
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
    
}

struct WeekdayHours: View {
    
    var model: CafeDetailViewModel
    var hoursIndex: Int
    var workday: String
    
    //TODO: hoursIndex and workday raus
    init(cafe: Cafe, hoursIndex: Int, workday: String) {
        self.model = CafeDetailViewModel(cafe: cafe)
        self.hoursIndex = hoursIndex
        self.workday = workday
    }
    
    var body: some View {
        HStack {
            Text("\(workday):")
                .frame(width:36,alignment: .leading)
            Text("\(model.hours)")
        }
        .font(.system(.callout, design: .rounded))
    }
}
