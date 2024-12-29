//
//  UpdateUserProfileUseCase.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 28/12/2024.
//
class UpdateUserProfileUseCase {
    private let service: UserProfileService
    
    init(service: UserProfileService) {
        self.service = service
    }
    
    func execute(profile: UserProfile) {
        service.updateUserProfile(profile)
    }
}
