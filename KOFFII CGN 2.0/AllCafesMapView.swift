//
//  AllCafesMapView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI
import MapKit

struct AllCafesMapView: View {
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
        
    @EnvironmentObject var mapViewStore: MapViewStore
    
    var body: some View {
        MapView(centerCoordinate: $centerCoordinate)
            .edgesIgnoringSafeArea(.top)
            .overlay(mapViewStore.showDetails ?
                    MapViewOverlay(cafe: mapViewStore.choosenCafe) : nil)
    }
}

struct AllCafesMapView_Previews: PreviewProvider {
    static var previews: some View {
        AllCafesMapView()
    }
}



//extension Map {
//    func mapStyle(_ mapType: MKMapType) -> some View {
//        MKMapView.appearance().mapType = mapType
//        return self
//    }
//}
//
//extension Map {
//    func mapStyle(_ mapType: MKMapType, showScale: Bool = true, showTraffic: Bool = false) -> some View {
//        let map = MKMapView.appearance()
//        map.mapType = mapType
//        map.showsScale = showScale
//        map.showsTraffic = showTraffic
//        return self
//    }
//
//    func addAnnotations(_ annotations: [MKAnnotation]) -> some View {
//        MKMapView.appearance().addAnnotations(annotations)
//        return self
//    }
//
//    func addOverlay(_ overlay: MKOverlay) -> some View {
//        MKMapView.appearance().addOverlay(overlay)
//        return self
//    }
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let identifier = "Capital"
//
//        let annotationView = MKPinAnnotationView(annotation:annotation, reuseIdentifier:identifier)
//        print(annotationView)
//        annotationView.isEnabled = true
//        annotationView.canShowCallout = true
//
//        let btn = UIButton(type: .detailDisclosure)
//        annotationView.rightCalloutAccessoryView = btn
//        return annotationView
//    }
//
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//
//    }
//}
