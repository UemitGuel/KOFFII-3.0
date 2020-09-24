
import UIKit

class MapsHelper {
    
    static let shared = MapsHelper()
    
    func openInGoogleMaps(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            // ?q=Pizza&center=37.759748,-122.427135
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Can't use comgooglemaps://")
        }
    }
}
