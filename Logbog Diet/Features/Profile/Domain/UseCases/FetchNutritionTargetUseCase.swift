//
//  FetchNutritionTargetUseCase.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 29/12/2024.
//
class FetchNutritionTargetUseCase {
    private let repository: NutritionTargetRepository

    init(repository: NutritionTargetRepository) {
        self.repository = repository
    }

    func execute() -> NutritionTarget {
        return repository.loadNutritionTarget() ?? NutritionTarget.defaultTarget(withTdee: 0)
    }
}
