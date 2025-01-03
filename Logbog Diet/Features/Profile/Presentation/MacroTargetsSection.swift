//
//  MacroTargetsSection.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 03/01/2025.
//

import SwiftUI

struct MacroTargetsSection: View {
    @Binding var nutritionTarget: NutritionTarget
    @State private var selectedPreset: MacroPreset?

    let macroPresets: [MacroPreset] = [
        MacroPreset(name: "Strength Training", proteinRatio: 0.35, fatRatio: 0.25, carbRatio: 0.40),
        MacroPreset(name: "Endurance Training", proteinRatio: 0.20, fatRatio: 0.25, carbRatio: 0.55),
        MacroPreset(name: "Fat Loss", proteinRatio: 0.40, fatRatio: 0.30, carbRatio: 0.30),
        MacroPreset(name: "Bulking", proteinRatio: 0.30, fatRatio: 0.20, carbRatio: 0.50),
        MacroPreset(name: "Keto", proteinRatio: 0.20, fatRatio: 0.70, carbRatio: 0.10)
    ]

    var body: some View {

        Section("Macro Targets") {

            // Macro Preset Picker
            Picker("Preset", selection: Binding<MacroPreset?>(
                get: { selectedPreset },
                set: { newPreset in
                    selectedPreset = newPreset
                    if let preset = newPreset {
                        applyMacroPreset(preset)
                    }
                }
            )) {
                Text("Select a Preset").tag(MacroPreset?.none)
                ForEach(macroPresets, id: \.name) { preset in
                    Text(preset.name).tag(preset as MacroPreset?)
                }
            }

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
