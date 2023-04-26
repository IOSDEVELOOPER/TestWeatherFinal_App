//
//  TestWeatherFinal_AppApp.swift
//  TestWeatherFinal_App
//
//  Created by Андрей Федоров on 26.04.2023.
//

import SwiftUI

@main
struct TestWeatherFinal_AppApp: App {
    @StateObject var viewModel = MainTabViewModel()
    var body: some Scene {
        WindowGroup {
            WeatherNow()
                .environmentObject(viewModel)
        }
    }
}


