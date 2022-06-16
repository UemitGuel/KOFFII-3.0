//
//  WeekdayHours.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 14.05.21.
//

import SwiftUI

struct WeekdayHours: View {
    
    var day: String
    var hours: String
    
    var body: some View {
        HStack {
            Text("\(day):")
            Spacer()
            Text("\(hours)")
        }
        .font(.system(.callout, design: .default))
    }
}
