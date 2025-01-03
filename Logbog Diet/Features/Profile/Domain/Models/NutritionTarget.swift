//
//  NutritionTarget.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import Foundation

struct NutritionTarget: Equatable, Codable {
    var tdee: Int
    var calories: Int         // Total daily calorie goal
    var proteins: Int      // Protein goal in grams
    var fats: Int          // Fat goal in grams
    var carbs: Int         // Carbohydrate goal in grams
    var goalPercentage: Double = 0.0

    init(tdee: Int, calories: Int = 0, proteins: Int = 0, fats: Int = 0, carbs: Int = 0, goalPercentage: Double = 0.0) {
        self.tdee = tdee
        self.calories = calories
        self.proteins = proteins
        self.fats = fats
        self.carbs = carbs
        self.goalPercentage = goalPercentage
    }

    // Derived property: Calculates total macronutrient calories
    var totalMacroCalories: Int {
        return Int((proteins * NutritionConstants.caloriesPerGramProtein) +
                   (fats * NutritionConstants.caloriesPerGramFat) +
                   (carbs * NutritionConstants.caloriesPerGramCarb))
    }

    // Validation to ensure consistency between calories and macros
    func isValid() -> Bool {
        return calories >= totalMacroCalories &&
               calories > 0 &&
               proteins >= 0 &&
               fats >= 0 &&
               carbs >= 0
    }

    // Updates `calories` when `goalPercentage` changes
    mutating func updateCalories() {
        self.calories = Int(Double(tdee) * (1 + goalPercentage / 100))
    }

    // Updates `goalPercentage` when `calories` changes
    mutating func updateGoalPercentage() {
        self.goalPercentage = (Double(calories) / Double(tdee) - 1) * 100
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
        percentage(forMacro: proteins, caloriesPerGram: NutritionConstants.caloriesPerGramProtein)
    }

    // Calculate fat percentage
    func fatPercentage() -> Double {
        percentage(forMacro: fats, caloriesPerGram: NutritionConstants.caloriesPerGramFat)
    }

    // Calculate carb percentage
    func carbPercentage() -> Double {
        percentage(forMacro: carbs, caloriesPerGram: NutritionConstants.caloriesPerGramCarb)
    }

    // Factory method for a default target
    static func defaultTarget(withTdee tdee: Int) -> NutritionTarget {
        return NutritionTarget(tdee: tdee)
    }
}
