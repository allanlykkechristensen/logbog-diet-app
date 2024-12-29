//
//  UserProfileService.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 28/12/2024.
//
class UserProfileService {
    private let repository: UserProfileRepository

    init(repository: UserProfileRepository) {
        self.repository = repository
    }

    // Fetches the user profile or creates a default one
    func getUserProfile() -> UserProfile {
        return repository.loadUserProfile() ?? UserProfile.defaultProfile()
    }

    // Saves the updated user profile
    func updateUserProfile(_ profile: UserProfile) {
        repository.saveUserProfile(profile)
    }
}
