//
//  Top3View.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 26.09.20.
//

import SwiftUI

struct Top3View: View {
    
    @EnvironmentObject var store: LocationStore
    
    var cafe1: Cafe
    var cafe2: Cafe
    var cafe3: Cafe
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                HStack {
                    CafeItem(cafe: cafe1)
                        .padding(.bottom)
                        .padding(.trailing)
                    NotesView(cafe: cafe1)
                        .frame(width: geo.size.width*0.5, alignment: .leading)
                }
                HStack {
                    NotesView(cafe: cafe2)
                        .frame(width: geo.size.width*0.5, alignment: .leading)
                    CafeItem(cafe: cafe2)
                        .padding(.vertical)
                        .padding(.leading)
                }
                HStack {
                    CafeItem(cafe: cafe3)
                        .padding(.vertical)
                        .padding(.trailing)
                    NotesView(cafe: cafe3)
                        .frame(width: geo.size.width*0.5, alignment: .leading)
                }
            }
            .padding()
            .navigationTitle("Ümit´s Top 3")
        }
        
        
    }
}

struct Top3View_Previews: PreviewProvider {
    static var previews: some View {
        Top3View(cafe1: cafeData[38], cafe2: cafeData[26], cafe3: cafeData[3])
    }
}

struct NotesView: View {
    
    var cafe: Cafe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(cafe.notes?[0] ?? "coming soon")
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.primary)
            Text(cafe.notes?[1] ?? "")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.primary).opacity(0.8)
            
            Spacer()
        }
        .padding(.top, 32)
    }
}
