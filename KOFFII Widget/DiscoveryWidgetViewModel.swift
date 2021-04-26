//
//  DiscoveryWidgetViewModel.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 26.04.21.
//

import Foundation

struct DiscoveryWidgetViewModel {
    
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

extension DiscoveryWidgetViewModel {

    var hoursMo: String {
        guard let start = self.cafe.hours?[0].start, let end = self.cafe.hours?[0].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursDi: String {
        guard let start = self.cafe.hours?[1].start, let end = self.cafe.hours?[1].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursMi: String {
        guard let start = self.cafe.hours?[2].start, let end = self.cafe.hours?[2].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursDo: String {
        guard let start = self.cafe.hours?[3].start, let end = self.cafe.hours?[3].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursFr: String {
        guard let start = self.cafe.hours?[4].start, let end = self.cafe.hours?[4].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursSa: String {
        guard let start = self.cafe.hours?[5].start, let end = self.cafe.hours?[5].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
    var hoursSo: String {
        guard let start = self.cafe.hours?[6].start, let end = self.cafe.hours?[6].end else {
            return ""
        }
        return "\(start) - \(end)"
    }
    
}
