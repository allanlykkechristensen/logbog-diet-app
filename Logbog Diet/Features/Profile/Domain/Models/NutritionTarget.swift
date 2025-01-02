//
//  NutritionTarget.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import Foundation

struct NutritionTarget: Equatable, Codable {
    var calories: Int         // Total daily calorie goal
    var proteins: Int      // Protein goal in grams
    var fats: Int          // Fat goal in grams
    var carbs: Int         // Carbohydrate goal in grams

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

    // Calculate percentage for a specific macro
    func percentage(forMacro grams: Int, caloriesPerGram: Int) -> Double {
        guard calories > 0 else {
            return 0
        }
        return (Double(grams) * Double(caloriesPerGram) / Double(calories)) * 100
    }

    // Calculate protein percentage
    func proteinPercentage() -> Double {
        percentage(forMacro: proteins, caloriesPerGram: 4)
    }

    // Calculate fat percentage
    func fatPercentage() -> Double {
        percentage(forMacro: fats, caloriesPerGram: 9)
    }

    // Calculate carb percentage
    func carbPercentage() -> Double {
        percentage(forMacro: carbs, caloriesPerGram: 4)
    }

    // Factory method for a default target
    static func defaultTarget() -> NutritionTarget {
        return NutritionTarget(calories: 2000, proteins: 100, fats: 70, carbs: 250)
    }
}
