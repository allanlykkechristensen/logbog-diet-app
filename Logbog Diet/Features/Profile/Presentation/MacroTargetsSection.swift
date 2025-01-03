//
//  MacroTargetsSection.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 03/01/2025.
//

import SwiftUI

struct MacroTargetsSection: View {
    @Binding var nutritionTarget: NutritionTarget

    var body: some View {

        Section("Macro Targets") {

            MacroPresetPicker(applyPreset: applyMacroPreset)

            NutritionTargetInput(
                label: "Proteins",
                value: $nutritionTarget.proteins,
                percentage: nutritionTarget.proteinPercentage())

            NutritionTargetInput(
                label: "Fats",
                value: $nutritionTarget.fats,
                percentage: nutritionTarget.fatPercentage())

            NutritionTargetInput(
                label: "Carbs",
                value: $nutritionTarget.carbs,
                percentage: nutritionTarget.carbPercentage())

            HStack {
                Text("Macro Calories (kcal)")
                Spacer()
                Text("\(nutritionTarget.totalMacroCalories)")
            }
        }
    }

    // Helper to apply a macro preset
    private func applyMacroPreset(_ preset: MacroPreset) {
        let calories = Double(nutritionTarget.calories)
        nutritionTarget.proteins = Int((calories * preset.proteinRatio) / 4)
        nutritionTarget.fats = Int((calories * preset.fatRatio) / 9)
        nutritionTarget.carbs = Int((calories * preset.carbRatio) / 4)
    }
}

struct MacroPreset: Hashable {
    let name: String
    let proteinRatio: Double
    let fatRatio: Double
    let carbRatio: Double
}

#Preview {
    @Previewable @State var nutritionTarget = NutritionTarget(tdee: 2000, calories: 2200)

    List {
        MacroTargetsSection(nutritionTarget: $nutritionTarget)
    }
}
