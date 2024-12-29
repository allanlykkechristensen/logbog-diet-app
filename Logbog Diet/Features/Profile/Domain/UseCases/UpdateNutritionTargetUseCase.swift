//
//  UpdateNutritionTargetUseCase.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 29/12/2024.
//
class UpdateNutritionTargetUseCase {
    private let repository: NutritionTargetRepository

    init(repository: NutritionTargetRepository) {
        self.repository = repository
    }

    func execute(target: NutritionTarget) {
        repository.saveNutritionTarget(target)
    }
}
