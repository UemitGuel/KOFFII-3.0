//
//  InformationDetailView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 25.04.21.
//

import SwiftUI

struct MethodDetailView: View {
    
    var info: Information
    var data = complainData
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                info.image
                    .resizable()
                    .frame(height: geo.size.height*0.35, alignment: .center)
                VStack(alignment: .leading) {
                    InformationDetailHeader(info: info)
                    Divider()
                    Text(info.title)
                        .bold()
                        .font(.system(.title, design: .rounded))
                    Text("Zubereitung")
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
                    .padding([.vertical, .bottom], 4)
                }
                .padding([.horizontal,.top])
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {}) {
                        HStack {
                            Text("Hey")
                            Image(systemName: "forward.fill").font(.title3).foregroundColor(.blue)
                        }
                        .frame(height: 125)
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }
                    Spacer()
                    Button(action: {}) {
                        HStack {
                            Text("Hey")
                            Image(systemName: "forward.fill").font(.title3).foregroundColor(.blue)
                        }
                        .frame(height: 125)
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct InformationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MethodDetailView(info: informationData[0])
        }
    }
}

struct InformationDetailHeader: View {
    
    var info: Information
    
    var body: some View {
        HStack {
            Label(
                title: { Text("\(info.quan ?? "")") },
                icon: { Image(systemName: "square.stack.3d.up") })
            Spacer()
            Label(
                title: { Text("\(info.time ?? "")") },
                icon: { Image(systemName: "timer") })
            Spacer()
            Label(
                title: { Text("\(info.temp ?? "")") },
                icon: { Image(systemName: "thermometer") })
        }
    }
}
