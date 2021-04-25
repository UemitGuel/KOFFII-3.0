//
//  CafeDetailView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 23.09.20.
//

import SwiftUI
import MapKit

struct CoffeeDetailView: View {
    
    var model: CoffeeDetailViewModel
    
    init(coffee: Coffee) {
        self.model = CoffeeDetailViewModel(coffee: coffee)
    }
        
    @State var regionVM = RegionStore.shared.region
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                Map(coordinateRegion: $regionVM, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: [model]) { item in
                    MapMarker(coordinate: item.coordinates)
                }
                .frame(height: geo.size.height*0.35, alignment: .center)
                VStack(alignment: .leading) {
                    HStack{
                        if model.isRoastery {
                            Label("Rösterei", image: "beans")
                        } else {
                            FeatureDisplayView(cafe: model.coffee)
                        }
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
                    GoogleMapsButton(locationURL: model.locationURL)
                        .padding(.top)
                    Divider()
                    if !model.isRoastery {
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
                                    WeekdayHours(cafe: model.coffee, hoursIndex: 0, workday: "Mo")
                                    WeekdayHours(cafe: model.coffee, hoursIndex: 1, workday: "Di")
                                    WeekdayHours(cafe: model.coffee, hoursIndex: 2, workday: "Mi")
                                    WeekdayHours(cafe: model.coffee, hoursIndex: 3, workday: "Do")
                                    WeekdayHours(cafe: model.coffee, hoursIndex: 4, workday: "Fr")
                                    WeekdayHours(cafe: model.coffee, hoursIndex: 5, workday: "Sa")
                                    WeekdayHours(cafe: model.coffee, hoursIndex: 6, workday: "So")
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
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
    
    var model: CoffeeDetailViewModel
    var hoursIndex: Int
    var workday: String
    
    //TODO: hoursIndex and workday raus
    init(cafe: Coffee, hoursIndex: Int, workday: String) {
        self.model = CoffeeDetailViewModel(coffee: cafe)
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
