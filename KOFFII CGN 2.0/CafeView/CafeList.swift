//
//  CoffeeList.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeList: View {
    var cafeListFiltered: [Cafe]
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
        #else
        content
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    
    var content: some View {
        ForEach(cafeListFiltered) { item in
            NavigationLink(
                destination: CafeDetailView(cafe: item),
                label: {
                    HStack(spacing:0) {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width:1)
                            .background(Color.accentColor)
                        VStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(height:1)
                                .background(Color.accentColor)
                                .padding(.bottom, 8)
                            CafeItem(cafe: item)
                                .padding(.bottom, 8)
                                .padding(.horizontal)
                            RoundedRectangle(cornerRadius: 8)
                                .frame(height:1)
                                .background(Color.accentColor)
                        }
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width:1)
                            .background(Color.accentColor)
                    }
                    .padding()

                })
        }
    }
}

struct CoffeeList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CafeList(cafeListFiltered: cafeData)
            CafeList(cafeListFiltered: cafeData)
                .preferredColorScheme(.dark)
        }
    }
}
