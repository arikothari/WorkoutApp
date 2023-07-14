
//
//  Workout_AppApp.swift
//  Workout App
//
//  Created by Ari Kothari on 7/6/23.
//

import SwiftUI

@main
struct Workout_App: App {
    let dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
        }
    }
}
