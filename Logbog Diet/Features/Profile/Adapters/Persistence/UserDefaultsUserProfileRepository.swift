//
//  UserDefaultsUserProfileRepository.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import Foundation

class UserDefaultsUserProfileRepository: UserProfileRepository {
    private let userDefaults = UserDefaults.standard
    private let userProfileKey = "userProfileKey"

    func loadUserProfile() -> UserProfile? {
        guard let data = userDefaults.data(forKey: userProfileKey),
              let profile = try? JSONDecoder().decode(UserProfile.self, from: data) else {
            return nil
        }
        return profile
    }

    func saveUserProfile(_ profile: UserProfile) {
        if let encoded = try? JSONEncoder().encode(profile) {
            userDefaults.set(encoded, forKey: userProfileKey)
        }
    }
}
