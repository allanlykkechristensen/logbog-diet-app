//
//  ProfileView.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import SwiftUI

public struct ProfileView: View {

    @StateObject private var viewModel: ProfileViewModel

    init(repository: UserProfileRepository, nutritionTargetRepository: NutritionTargetRepository) {

        let fetchUserProfileUseCase = FetchUserProfileUseCase(service: UserProfileService(repository: repository))
        let updateUserProfileUseCase = UpdateUserProfileUseCase(service: UserProfileService(repository: repository))
        let fetchNutritionTargetUseCase = FetchNutritionTargetUseCase(repository: nutritionTargetRepository)
        let updateNutritionTargetUseCase = UpdateNutritionTargetUseCase(repository: nutritionTargetRepository)

        _viewModel = StateObject(
            wrappedValue:
                ProfileViewModel(
                    fetchUserProfileUseCase: fetchUserProfileUseCase,
                    updateUserProfileUseCase: updateUserProfileUseCase,
                    fetchNutritionTargetUseCase: fetchNutritionTargetUseCase,
                    updateNutritionTargetUseCase: updateNutritionTargetUseCase)
        )
    }

    public var body: some View {
        VStack {
            ProfileHeader(userProfile: viewModel.userProfile)

            List {
                PersonalDetailsSection(userProfile: $viewModel.userProfile)
                NutritionTargetSection(nutritionTarget: $viewModel.nutritionTarget)
                MacroTargetsSection(nutritionTarget: $viewModel.nutritionTarget)

                CalorieForecastChart(
                    currentWeight: $viewModel.userProfile.weight,
                    calorieTarget: $viewModel.nutritionTarget.calories,
                    tdee: $viewModel.nutritionTarget.tdee)
            }
        }
        .onAppear {
            viewModel.loadUserProfile()
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(
            repository: UserDefaultsUserProfileRepository(),
            nutritionTargetRepository: UserDefaultsNutritionTargetRepository())
    }
}
