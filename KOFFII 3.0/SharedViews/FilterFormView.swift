//
//  FilterFormView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 22.04.21.
//

import SwiftUI

struct FilterFormView: View {
    
    @EnvironmentObject var model: CoffeeListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("Cafe - Features")) {
                Toggle(isOn: $model.needWifi, label: {
                    Label(
                        title: { Text("Wifi") },
                        icon: { Image(systemName: "wifi") }
                    )
                }).toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
                Toggle(isOn: $model.needFood, label: {
                    Label(
                        title: { Text("Lunch") },
                        icon: { Image(systemName: "fork.knife")}
                    )
                }).toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
                Toggle(isOn: $model.needVegan, label: {
                    Label(
                        title: { Text("Vegan") },
                        icon: { Image(systemName: "leaf") }
                    )
                }).toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
                Toggle(isOn: $model.needPlug, label: {
                    Label(
                        title: { Text("Strom") },
                        icon: { Image(systemName: "powerplug") }
                    )
                }).toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
            }
            Section(header: Text("Röstereien")) {
                Toggle(isOn: $model.includeRosteries, label: {
                    Label(
                        title: { Text("Röstereien") },
                        icon: { Image("beans") }
                    )
                }).toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
            }
            Button(action: { updateCafeListAndDismiss() }) {
                Text("Filter anwenden")
                    .foregroundColor(Color.accentColor)
            }
        }
        .padding(.top, 64)
    }
    
    
    func updateCafeListAndDismiss() {
//        model.filterCoffeeList()
        presentationMode.wrappedValue.dismiss()
    }
}

struct FilterFormView_Previews: PreviewProvider {
    static var previews: some View {
        FilterFormView()
            .environmentObject(CoffeeListViewModel())
    }
}
