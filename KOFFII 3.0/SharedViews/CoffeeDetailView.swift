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
    
    let infoRandom = informationData.randomElement()!
    #if !APPCLIP
    @State private var isPresented = false
    #endif
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                Map(coordinateRegion: $regionVM, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: [model]) { item in
                    MapMarker(coordinate: item.coordinates)
                }
                .frame(height: geo.size.height*0.35, alignment: .center)
                .allowsHitTesting(false)
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading) {
                        HStack {
                            if model.isRoastery {
                                Label("Rösterei", image: "beans")
                            } else {
                                FeatureDisplayView(cafe: model.coffee)
                            }
                            Spacer()
                            Text(model.distance)
                        }
                        .padding(.bottom, 4)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.secondary)
                        Text(model.name)
                            .bold()
                            .font(.system(.title, design: .rounded))
                        Text(model.hood)
                            .foregroundColor(Color(.secondaryLabel))
                            .font(.system(.body, design: .rounded))
                        GoogleMapsButton(locationURL: model.locationURL)
                    }
                    if !model.isRoastery {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Öffnungszeiten")
                                .font(.system(.title2, design: .rounded))
                                .bold()
                                .padding(.bottom, 4)
                            HStack {
                                if model.hasImage {
                                    Image(model.name)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: geo.size.height*0.25)
                                        .cornerRadius(16)
                                    Spacer()
                                } else {
                                    Spacer()
                                    VStack(alignment: .center, spacing: 8) {
                                        Image(systemName: "rectangle.slash.fill")
                                        Text("(Noch) kein Foto")
                                    }
                                    Spacer()
                                }
                                VStack(alignment: .leading) {
                                    WeekdayHours(day: "Mo", hours: model.hoursMo)
                                    WeekdayHours(day: "Di", hours: model.hoursDi)
                                    WeekdayHours(day: "Mi", hours: model.hoursMi)
                                    WeekdayHours(day: "Do", hours: model.hoursDo)
                                    WeekdayHours(day: "Fr", hours: model.hoursFr)
                                    WeekdayHours(day: "Sa", hours: model.hoursSa)
                                    WeekdayHours(day: "So", hours: model.hoursSo)
                                }
                                .padding()
                                .frame(width: 180)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(16)
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom])
                .padding(.top, 8)
                if (model.hasNotes) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ümit´s Notizen")
                            .font(.system(.title2, design: .rounded))
                            .bold()
                            .padding(.bottom, 4)
                        Text(model.notesBody)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(16)
                        
                    }
                    .padding(.bottom)
                    .padding(.horizontal, 12)
                }
                #if !APPCLIP
                VStack(alignment: .leading, spacing: 2) {
                    Text("Wusstest du schon..?")
                        .font(.system(.title2, design: .rounded))
                        .bold()
                        .padding(.bottom, 4)
                        .padding([.leading])
                    Button(action: { isPresented.toggle() }, label: {
                        InformationListItem(info: infoRandom)
                    })
                }
                .padding(.bottom)
                .sheet(isPresented: $isPresented) {
                    InformationDetailCoordinator(info: infoRandom)
                }
                #endif
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
    
}

struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetailView(coffee: coffeeData[34])
    }
}
