//
//  SpotlightView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 25.09.20.
//

import SwiftUI

struct SpotlightView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            Text("Ümit´s Empfehlungen")
                .font(.headline)
            TabView {
                SpotlightItem(cafe: cafeData[1])
                SpotlightItem(cafe: cafeData[1])
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .frame(height: 250)
            Divider()
        }
        .padding()
        
    }
}

struct SpotlightView_Previews: PreviewProvider {
    static var previews: some View {
        SpotlightView()
    }
}

struct SpotlightItem: View {
        
    var cafe: Cafe
    
    var body: some View {
        HStack {
            if cafe.photo {
                Image(cafe.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } else {
                Text("in Arbeit :)")
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(Color.gray)
            }
            HStack {
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    Text(cafe.name)
                        .multilineTextAlignment(.trailing)
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.primary)
                    Text(cafe.hood.rawValue)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                    Spacer()
                    Text("Ümit´s Notizen")
                        .font(.system(.headline, design: .rounded))
                        .padding(.bottom, 4)
                    Text("Komment 1")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                    Text("Komment 2")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                    Text("Und mehr ...")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)

                }.padding(.vertical)
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
        }
        .frame(height: 250)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.accentColor, lineWidth: 1)
        )
    }
}
