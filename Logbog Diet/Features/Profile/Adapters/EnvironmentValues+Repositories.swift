//
//  EnvironmentValues+Repositories.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 29/12/2024.
//
import SwiftUI

extension EnvironmentValues {
    @Entry var nutritionTargetRepository: NutritionTargetRepository = UserDefaultsNutritionTargetRepository()
    @Entry var userProfileRepository: UserProfileRepository = UserDefaultsUserProfileRepository()
}
