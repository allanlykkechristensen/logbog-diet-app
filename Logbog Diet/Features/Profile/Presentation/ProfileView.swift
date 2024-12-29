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
        _viewModel = StateObject(
            wrappedValue:
                ProfileViewModel(
                    fetchUserProfileUseCase: FetchUserProfileUseCase(service: UserProfileService(repository: repository)),
                    updateUserProfileUseCase: UpdateUserProfileUseCase(service: UserProfileService(repository: repository)),
                    fetchNutritionTargetUseCase: FetchNutritionTargetUseCase(repository: nutritionTargetRepository),
                    updateNutritionTargetUseCase: UpdateNutritionTargetUseCase(repository: nutritionTargetRepository))
        )
    }

    public var body: some View {
        VStack {
            ProfileHeader(userProfile: viewModel.userProfile)

            List {
                PersonalDetailsSection(userProfile: $viewModel.userProfile)
                NutritionTargetSection(nutritionTarget: $viewModel.nutritionTarget)
            }
        }
        .onAppear() {
            viewModel.loadUserProfile()
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(repository: UserDefaultsUserProfileRepository(), nutritionTargetRepository: UserDefaultsNutritionTargetRepository())
    }
}
