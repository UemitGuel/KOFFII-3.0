//
//  AllMapViewHelper.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI

class MapViewStore: ObservableObject{
    
    @Published var choosenCafe: Cafe = cafeData[0]
    @Published var showDetails: Bool = false
    
    func changeChoosenCafe(cafe: Cafe) {
        choosenCafe = cafe
    }
}
