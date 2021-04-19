
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var mapViewStore: MapViewStore
    
    var annotations = AnnotationsHelper.shared.getallAnnotation()
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
        
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.addAnnotations(annotations)
        mapView.showsUserLocation = true
        mapView.region = CoordinatesHelper.shared.setRegionMidCologne()
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, mapViewStore: mapViewStore)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var mapViewStore: MapViewStore
        
        var parent: MapView
        
        init(_ parent: MapView, mapViewStore: MapViewStore) {
            self.parent = parent
            self.mapViewStore = mapViewStore
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard annotation is MKPointAnnotation else { return nil }

            let identifier = "Annotation"
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

            if annotationView == nil {
                let annotationView = MKMarkerAnnotationView(annotation:annotation, reuseIdentifier:identifier)
                annotationView.isEnabled = true
                annotationView.canShowCallout = true

                let btn = UIButton(type: .detailDisclosure)
                annotationView.rightCalloutAccessoryView = btn
                return annotationView
            } else {
                annotationView!.annotation = annotation
            }

            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            let choosenCafeName = view.annotation?.title
            
            if let cafe = cafeData.first(where: {$0.name == choosenCafeName}) {
                self.mapViewStore.changeChoosenCafe(cafe: CafeViewModel(cafe: cafe))
                print(mapViewStore.showDetails)
                self.mapViewStore.showDetails = true
                print(mapViewStore.showDetails)
            } else {
               fatalError()
            }
        }
    }
}