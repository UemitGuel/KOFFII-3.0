//
//  FilterFormView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 22.04.21.
//

import SwiftUI

struct FilterFormView: View {
    
    @EnvironmentObject var model: CafeListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("Was soll das Cafe haben?")) {
                Toggle(isOn: $model.needWifi, label: {
                    Label(
                        title: { Text("Wifi") },
                        icon: { Image(systemName: "wifi") }
                    )
                })
                Toggle(isOn: $model.needFood, label: {
                    Label(
                        title: { Text("Lunch") },
                        icon: { Image("FOOD") }
                    )
                })
                Toggle(isOn: $model.needVegan, label: {
                    Label(
                        title: { Text("Vegan") },
                        icon: { Image(systemName: "leaf") }
                    )
                })
                Toggle(isOn: $model.needPlug, label: {
                    Label(
                        title: { Text("Strom") },
                        icon: { Image(systemName: "bolt") }
                    )
                })
            }
            Button(action: { updateCafeListAndDismiss() }) {
                Text("Filter anwenden")
                    .foregroundColor(Color(.systemBlue))
            }
        }
        .padding(.top, 64)
    }
    
    
    func updateCafeListAndDismiss() {
        model.filterCafeList()
        presentationMode.wrappedValue.dismiss()
    }
}

struct FilterFormView_Previews: PreviewProvider {
    static var previews: some View {
        FilterFormView()
            .environmentObject(CafeListViewModel())
    }
}
