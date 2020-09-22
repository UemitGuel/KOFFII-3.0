//
//  FilterButtons.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 22.09.20.
//

import SwiftUI

struct FilterButtons: View {
    
    @EnvironmentObject var store: FilterStore
    
    var body: some View {
        HStack {
            Button(action: {
                self.store.toggleWifi()
            }, label: {
                HStack(spacing: 4)  {
                    Image(systemName: "wifi")
                    Text("Wifi")
                }
                .foregroundColor(self.store.filterForWifi ? Color(.systemBackground) : .accentColor)
                .font(.system(.caption, design: .rounded))
                .padding()
                .frame(height:44)
                .background(self.store.filterForWifi ? Color.accentColor : nil)
                .cornerRadius(self.store.filterForWifi ? 16 : 0)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.accentColor, lineWidth: 2)
                )
            })
            Button(action: {
                self.store.toggleFood()
            }, label: {
                HStack(spacing: 4)  {
                    Image(systemName: "mouth")
                    Text("Lunch")
                }
                .foregroundColor(self.store.filterForFood ? Color(.systemBackground) : .accentColor)
                .font(.system(.caption, design: .rounded))
                .padding()
                .frame(height:44)
                .background(self.store.filterForFood ? Color.accentColor : nil)
                .cornerRadius(self.store.filterForFood ? 16 : 0)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.accentColor, lineWidth: 2)
                )
            })
            Button(action: {
                self.store.toggleVegan()
            }, label: {
                HStack(spacing: 4)  {
                    Image(systemName: "leaf")
                    Text("Vegan")
                }
                .foregroundColor(self.store.filterForVegan ? Color(.systemBackground) : .accentColor)
                .font(.system(.caption, design: .rounded))
                .padding()
                .frame(height:44)
                .background(self.store.filterForVegan ? Color.accentColor : nil)
                .cornerRadius(self.store.filterForVegan ? 16 : 0)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.accentColor, lineWidth: 2)
                )
            })
            Button(action: {
                self.store.togglePlug()
            }, label: {
                HStack(spacing: 4)  {
                    Image(systemName: "bolt")
                    Text("Strom")
                }
                .foregroundColor(self.store.filterForPlug ? Color(.systemBackground) : .accentColor)
                .font(.system(.caption, design: .rounded))
                .padding(12)
                .frame(height:44)
                .background(self.store.filterForPlug ? Color.accentColor : nil)
                .cornerRadius(self.store.filterForPlug ? 16 : 0)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.accentColor, lineWidth: 2)
                )
            })
            Spacer()
        }
        .padding(.horizontal)

    }
}

struct FilterButtons_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FilterButtons()
            FilterButtons()
                .preferredColorScheme(.dark)
        }
    }
}
