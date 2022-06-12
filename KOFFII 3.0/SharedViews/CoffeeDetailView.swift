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
    @Environment(\.dismiss) var dismiss
    
    init(coffee: NewCoffeeModel) {
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
                ZStack(alignment: .topTrailing) {
                    Map(coordinateRegion: $regionVM, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: [model]) { item in
                        MapMarker(coordinate: item.coordinates)
                    }
                    .frame(height: geo.size.height*0.35, alignment: .center)
                    .allowsHitTesting(false)
                    Text("Entfernung: \(model.distance)")
                        .padding()
                        .background(Color("Olive1"))
                        .cornerRadius(16)
                        .padding(8)
                }
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading) {
//                            if model.isRoastery {
//                                Label("Rösterei", image: "beans")
//                            } else {
                                FeatureDisplayView(cafe: model.coffee)
//                            }
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
//                    if !model.isRoastery {
                            HStack {
                                if model.coffee.imageURL != nil {
                                    AsyncImage(url: model.coffee.imageURL) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(16)
                                    } placeholder: {
                                        EmptyView()
                                    }
                                    Spacer()
                                }
                            }
                        
//                    }
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
            .background(Color("Olive1"))
        }
    }
    
}
