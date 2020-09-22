//
//  FilterStore.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 22.09.20.
//

import SwiftUI
import Combine

class FilterStore: ObservableObject {
    
    @Published var filterForWifi = false
    @Published var filterForFood = false
    @Published var filterForVegan = false
    @Published var filterForPlug = false
    
    func toggleWifi() {
        filterForWifi.toggle()
    }
    
    func toggleFood() {
        filterForFood.toggle()
    }
    
    func toggleVegan() {
        filterForVegan.toggle()
    }
    
    func togglePlug() {
        filterForPlug.toggle()
    }

}
