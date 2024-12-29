//
//  UserProfileRepository.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 28/12/2024.
//
protocol UserProfileRepository {
    func loadUserProfile() -> UserProfile?
    func saveUserProfile(_ profile: UserProfile)
}
