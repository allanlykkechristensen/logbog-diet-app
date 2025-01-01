//
//  NutritionTargetSection.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import SwiftUI

struct NutritionTargetSection: View {
    @Binding var nutritionTarget: NutritionTarget

    var body: some View {

        Section("Nutrition Targets") {
            NutritionTargetInput(label: "Calories (kcal)", value: $nutritionTarget.calories)
        }

        Section {
            NutritionTargetInput(
                label: "Proteins",
                value: $nutritionTarget.proteins,
                percentage: nutritionTarget.macroPercentages()?.proteinPercent)

            NutritionTargetInput(
                label: "Fats",
                value: $nutritionTarget.fats,
                percentage: nutritionTarget.macroPercentages()?.fatPercent)

            NutritionTargetInput(
                label: "Carbs",
                value: $nutritionTarget.carbs,
                percentage: nutritionTarget.macroPercentages()?.carbPercent)

            HStack {
                Text("Macro Calories (kcal)")
                Spacer()
                Spacer()
                Text(String(format: "%d", nutritionTarget.totalMacroCalories))
            }
        }

    }
}

#Preview {
    @Previewable @State var nutritionTarget = NutritionTarget.defaultTarget()

    List {
        NutritionTargetSection(nutritionTarget: $nutritionTarget)
    }
}
