//
//  AnnotationsHelper.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import Foundation
import MapKit

class AnnotationsHelper {
    
    static let shared = AnnotationsHelper()
    
    func getallAnnotation() -> [MKAnnotation] {
        var annotations: [MKAnnotation] = []
        for cafe in cafeData {
            let annotation = MKPointAnnotation()
            annotation.title = cafe.name
            annotation.coordinate = cafe.coordinates
            annotations.append(annotation)
        }
        return annotations
    }
}
