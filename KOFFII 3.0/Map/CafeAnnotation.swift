import MapKit

class CafeAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    let cafe: CoffeeModel
    let title: String?
   
    init(cafe: CoffeeModel) {
        self.cafe = cafe
        self.title = cafe.name
        self.coordinate = cafe.coordinates
        
        super.init()
    }
}
