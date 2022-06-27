import SwiftUI

struct FilterFormView: View {
    
    @EnvironmentObject var model: CoffeeListViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            Section(header: Text("Cafe - Features")) {
                ForEach(model.requestedFeatures, id: \.feature) { feature in
                    Toggle(isOn: Binding(get: {
                        feature.isUserRequested
                    }, set: { newValue in
                        feature.isUserRequested = newValue
                    }), label: {
                        Label(
                            title: { Text(feature.feature.title) },
                            icon: { feature.feature.icon }
                        )
                    }).toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
                }
            }
            Button(action: { updateCafeListAndDismiss() }) {
                Text("Filter anwenden")
                    .foregroundColor(Color.accentColor)
            }
        }
        .padding(.top, 64)
    }
    
    
    func updateCafeListAndDismiss() {
        model.filterCoffeeList()
        presentationMode.wrappedValue.dismiss()
    }
}

struct FilterFormView_Previews: PreviewProvider {
    static var previews: some View {
        FilterFormView()
            .environmentObject(CoffeeListViewModel())
    }
}
