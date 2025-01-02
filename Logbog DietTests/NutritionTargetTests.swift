//
//  NutritionTargetTests.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 02/01/2025.
//
import Testing
@testable import Logbog_Diet

struct NutritionTargetsTests {

    @Test func testTotalMacroCaloriesCalculation() {
        let nutritionTarget = NutritionTarget(calories: 2000, proteins: 100, fats: 50, carbs: 200)
        #expect(nutritionTarget.totalMacroCalories == 1650)
    }

    @Test func testProteinPercentageCalculation() {
        let nutritionTarget = NutritionTarget(calories: 2000, proteins: 100, fats: 50, carbs: 200)
        #expect(nutritionTarget.proteinPercentage() == 20.0)
    }

    @Test func testFatsPercentageCalculation() {
        let nutritionTarget = NutritionTarget(calories: 2000, proteins: 100, fats: 50, carbs: 200)
        #expect(nutritionTarget.fatPercentage() == 22.5)
    }

    @Test func testCarbsPercentageCalculation() {
        let nutritionTarget = NutritionTarget(calories: 2000, proteins: 100, fats: 50, carbs: 200)
        #expect(nutritionTarget.carbPercentage() == 40.0)
    }

    @Test func testMacroPercentageCalculationWithZeroCalories() {
        let nutritionTarget = NutritionTarget(calories: 0, proteins: 100, fats: 50, carbs: 200)
        #expect(nutritionTarget.proteinPercentage() == 0.0)
    }
}
