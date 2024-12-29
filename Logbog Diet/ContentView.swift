//
//  ContentView.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.userProfileRepository) var userProfileRepository
    @Environment(\.nutritionTargetRepository) var nutritionTargetRepository

    var body: some View {
        TabView {
            NavigationStack {
                ProfileView(
                    repository: userProfileRepository,
                    nutritionTargetRepository: nutritionTargetRepository)
            }.tabItem {
                Label("Profile", systemImage: "person")
            }
        }
    }
}

#Preview {
    ContentView()
}
