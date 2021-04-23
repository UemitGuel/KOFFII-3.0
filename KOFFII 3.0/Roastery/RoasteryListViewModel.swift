//
//  RoasteryListViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 23.04.21.
//

import Foundation

class RoasteryListViewModel: ObservableObject {
    
    @Published var roasteryList: [Roastery]
    
    init() {
        self.roasteryList = roasteryData
    }
    
}
