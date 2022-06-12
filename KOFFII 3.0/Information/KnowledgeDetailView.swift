//
//  KnowledgeDetailView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 29.04.21.
//

import SwiftUI

struct KnowledgeDetailView: View {
    
    var info: Information
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                info.image
                    .resizable()
                    .frame(height: geo.size.height*0.35, alignment: .center)
                VStack(alignment: .leading) {
                    Text(info.title)
                        .bold()
                        .font(.system(.title, design: .rounded))
                    Text("Informationen")
                        .foregroundColor(Color(.secondaryLabel))
                        .font(.system(.body, design: .rounded))
                    ForEach(0..<info.steps.count) { index in
                        HStack {
                            Label(
                                title: { Text(info.steps[index]) },
                                icon: { Image(systemName: "\(index + 1).square") })
                            Spacer()
                        }
                    }
                    .padding(.top, 8)
                    .padding([.vertical, .bottom], 4)
                }
                .padding([.horizontal,.top])
            }
            .navigationBarTitle("", displayMode: .inline)
            .background(Color("Olive1"))
        }
    }
}
struct KnowledgeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        KnowledgeDetailView(info: informationData[0])
    }
}
