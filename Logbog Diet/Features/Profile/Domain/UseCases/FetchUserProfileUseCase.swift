//
//  FetchUserProfileUseCase.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import Foundation

struct FetchUserProfileUseCase {
    private let service: UserProfileService

    init(service: UserProfileService) {
        self.service = service
    }

    func execute() -> UserProfile {
        return service.getUserProfile()
    }
}
