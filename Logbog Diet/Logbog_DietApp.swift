//
//  Logbog_DietApp.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//

import SwiftUI
import SwiftData

@main
struct Logbog_DietApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.nutritionTargetRepository, UserDefaultsNutritionTargetRepository())
                .environment(\.userProfileRepository, UserDefaultsUserProfileRepository())
        }
    }
}

