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
        var sut = NutritionTarget(tdee: 2000)
        sut.proteins = 100
        sut.fats = 50
        sut.carbs = 200

        #expect(sut.totalMacroCalories == 1650)
    }

    @Test func testProteinPercentageCalculation() {
        var sut = NutritionTarget(tdee: 2000)
        sut.calories = 2000
        sut.proteins = 100
        sut.fats = 50
        sut.carbs = 200

        #expect(sut.proteinPercentage() == 20.0)
    }

    @Test func testFatsPercentageCalculation() {
        var sut = NutritionTarget(tdee: 2000)
        sut.calories = 2000
        sut.proteins = 100
        sut.fats = 50
        sut.carbs = 200

        #expect(sut.fatPercentage() == 22.5)
    }

    @Test func testCarbsPercentageCalculation() {
        var sut = NutritionTarget(tdee: 2000)
        sut.calories = 2000
        sut.proteins = 100
        sut.fats = 50
        sut.carbs = 200

        #expect(sut.carbPercentage() == 40.0)
    }

    @Test func testMacroPercentageCalculationWithZeroCalories() {
        var sut = NutritionTarget(tdee: 0)
        sut.proteins = 100
        sut.fats = 50
        sut.carbs = 200

        #expect(sut.proteinPercentage() == 0.0)
    }
}
