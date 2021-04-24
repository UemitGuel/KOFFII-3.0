//
//  DiscoveryCafeViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 19.04.21.
//

import Foundation

struct DiscoveryCafeViewModel: Identifiable {
    
    let id = UUID()
    var cafe: Coffee
    
    init(cafe: Coffee) {
        self.cafe = cafe
    }
    
    var name: String {
        return self.cafe.name
    }
    
    var notesTitle: String {
        return self.cafe.notes[0]
    }
    
    var notesBody: String {
        return self.cafe.notes[1]
    }
}
