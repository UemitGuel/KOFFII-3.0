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
    
    func getallAnnotation(cafeList: [Coffee]) -> [MKAnnotation] {
        var annotations: [MKAnnotation] = []
        for cafe in cafeList {
            let annotation = CafeAnnotation(cafe: cafe)
            annotation.coordinate = cafe.coordinates
            annotations.append(annotation)
        }
        return annotations
    }
}
