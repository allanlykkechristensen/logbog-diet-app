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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.nutritionTargetRepository, UserDefaultsNutritionTargetRepository())
                .environment(\.userProfileRepository, UserDefaultsUserProfileRepository())
        }
        .modelContainer(sharedModelContainer)
    }
}

