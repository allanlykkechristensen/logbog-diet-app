//
//  ProfileViewModel.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var userProfile: UserProfile {
        didSet {
            saveUserProfile()
            syncTdeeBetweenUserProfileAndNutritionTarget()
        }
    }

    @Published var nutritionTarget: NutritionTarget {
        didSet {
            saveNutritionTarget()
        }
    }

    private let fetchUserProfileUseCase: FetchUserProfileUseCase
    private let updateUserProfileUseCase: UpdateUserProfileUseCase
    private let fetchNutritionTargetUseCase: FetchNutritionTargetUseCase
    private let updateNutritionTargetUseCase: UpdateNutritionTargetUseCase

    init(fetchUserProfileUseCase: FetchUserProfileUseCase,
         updateUserProfileUseCase: UpdateUserProfileUseCase,
         fetchNutritionTargetUseCase: FetchNutritionTargetUseCase,
         updateNutritionTargetUseCase: UpdateNutritionTargetUseCase) {
        self.fetchUserProfileUseCase = fetchUserProfileUseCase
        self.updateUserProfileUseCase = updateUserProfileUseCase
        self.fetchNutritionTargetUseCase = fetchNutritionTargetUseCase
        self.updateNutritionTargetUseCase = updateNutritionTargetUseCase

        self.userProfile = fetchUserProfileUseCase.execute()
        self.nutritionTarget = fetchNutritionTargetUseCase.execute()
        syncTdeeBetweenUserProfileAndNutritionTarget()
    }

    func syncTdeeBetweenUserProfileAndNutritionTarget() {
        self.nutritionTarget.tdee = self.userProfile.tdee
        self.nutritionTarget.updateGoalPercentage()
    }

    func loadUserProfile() {
        self.userProfile = fetchUserProfileUseCase.execute()
    }

    func saveUserProfile() {
        updateUserProfileUseCase.execute(profile: userProfile)
    }

    func saveNutritionTarget() {
        updateNutritionTargetUseCase.execute(target: nutritionTarget)
    }
}
