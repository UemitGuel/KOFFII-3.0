//
//  AllMapViewHelper.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI

class MapViewStore: ObservableObject{
    
    @Published var chosenCafe: CoffeeModel = CoffeeModel()
    @Published var annotationSelected: CafeAnnotation?
    @Published var showDetails: Bool = false
    
    func changeChosenCafe(cafe: CoffeeModel) {
        chosenCafe = cafe
    }
}
