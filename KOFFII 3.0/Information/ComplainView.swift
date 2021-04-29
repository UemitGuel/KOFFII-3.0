//
//  ComplainView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 29.04.21.
//

import SwiftUI

struct ComplainView: View {
    
    var complain: Complain
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
            Section(header: header, footer: backButton) {
                ForEach(complain.improvements, id: \.self) { impro in
                    Label(
                        title: { Text(impro) },
                        icon: { Image(systemName: "dot.square") }
                    )
                    .foregroundColor(Color(.label))
                }
            }
        }.listStyle(InsetGroupedListStyle())
        .padding(.top, 32)
    }
    
    var header: some View {
        Text(complain.title)
            .bold()
            .font(.system(.title, design: .rounded))
    }
    
    var backButton: some View {
        HStack {
            Spacer()
            Button(action: {
                presentationMode.wrappedValue.dismiss()}) {
                Label(
                    title: { Text("Zurück").bold() },
                    icon: { Image(systemName: "arrow.uturn.backward.square").imageScale(.large) })
            }.buttonStyle(PlainButtonStyle())
            .frame(width: 122, height: 44, alignment: .center)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(16)
        }
    }
}

struct ComplainView_Previews: PreviewProvider {
    static var previews: some View {
        ComplainView(complain: complainData[0])
    }
}
