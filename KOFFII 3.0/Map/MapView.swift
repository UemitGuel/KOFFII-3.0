
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var mapViewStore: MapViewStore
    
    var helper = AnnotationsHelper.shared
    
    @Binding var coffeeList: [NewCoffeeModel]

    @Binding var centerCoordinate: CLLocationCoordinate2D
    
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.938766, longitude: 6.959674), span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15))

    var locationStore = LocationStore.shared
        
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator

        // use locationStore to ask user for permission for there user location
        _ = locationStore
        mapView.showsUserLocation = true
        mapView.setRegion(region, animated: false)
        let annotations = helper.getallAnnotation(cafeList: coffeeList)
        mapView.addAnnotations(annotations)
        mapView.showsUserLocation = true
        let categories: [MKPointOfInterestCategory] = [.cafe]
        let filter = MKPointOfInterestFilter(including: categories)
        mapView.pointOfInterestFilter = filter
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
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {

            if let annotation = view.annotation as? CafeAnnotation {
                showDetails(mapView, for: annotation)
            } else {
                return
            }
            
        }
        
        private func showDetails(_ mapView: MKMapView, for annotation: CafeAnnotation) {
            parent.mapViewStore.annotationSelected = annotation
            mapViewStore.changeChosenCafe(cafe: annotation.cafe)
            mapViewStore.showDetails = true
            mapView.deselectAnnotation(annotation, animated: false)
        }
    }
}
