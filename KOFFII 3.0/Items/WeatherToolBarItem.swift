//
//  CustomModifier.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 12.05.21.
//

import SwiftUI

struct WeatherToolBarItem: ViewModifier {
    
    var model: WeatherModel
    @EnvironmentObject var weatherStore: WeatherStore

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 4) {
                        if !weatherStore.didFail {
                            Image(systemName: model.conditionName)
                            Text(model.temperatureString)
                        }
                    }
                }
            }
    }
}

extension View {
    func addWeatherToolbarItem(with model: WeatherModel) -> some View {
        self.modifier(WeatherToolBarItem(model: model))
    }
}
