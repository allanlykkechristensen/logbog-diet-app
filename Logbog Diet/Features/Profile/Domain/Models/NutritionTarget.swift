//
//  NutritionTarget.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import Foundation

struct NutritionTarget: Equatable, Codable {
    var calories: Int         // Total daily calorie goal
    var proteins: Double      // Protein goal in grams
    var fats: Double          // Fat goal in grams
    var carbs: Double         // Carbohydrate goal in grams

    // Derived property: Calculates total macronutrient calories
    var totalMacroCalories: Int {
        return Int((proteins * 4) + (fats * 9) + (carbs * 4))
    }

    // Validation to ensure consistency between calories and macros
    func isValid() -> Bool {
        return calories >= totalMacroCalories &&
               calories > 0 &&
               proteins >= 0 &&
               fats >= 0 &&
               carbs >= 0
    }

    // Method to calculate macronutrient percentages
    func macroPercentages() -> (proteinPercent: Double, fatPercent: Double, carbPercent: Double)? {
        guard calories > 0 else { return nil }
        let totalCalories = Double(calories)
        let proteinPercent = (proteins * 4) / totalCalories * 100
        let fatPercent = (fats * 9) / totalCalories * 100
        let carbPercent = (carbs * 4) / totalCalories * 100
        return (proteinPercent, fatPercent, carbPercent)
    }

    // Factory method for a default target
    static func defaultTarget() -> NutritionTarget {
        return NutritionTarget(calories: 2000, proteins: 100.0, fats: 70.0, carbs: 250.0)
    }
}
