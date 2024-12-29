//
//  UserDefaultsNutritionTargetRepository.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 29/12/2024.
//
import Foundation

class UserDefaultsNutritionTargetRepository: NutritionTargetRepository {
    private let userDefaults = UserDefaults.standard
    private let key = "nutritionTargetKey"

    func loadNutritionTarget() -> NutritionTarget? {
        guard let data = userDefaults.data(forKey: key),
              let target = try? JSONDecoder().decode(NutritionTarget.self, from: data) else {
            return nil
        }
        return target
    }

    func saveNutritionTarget(_ target: NutritionTarget) {
        if let encoded = try? JSONEncoder().encode(target) {
            userDefaults.set(encoded, forKey: key)
        }
    }
}
