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
        }
    }
}

#Preview {
    @Previewable @State var nutritionTarget = NutritionTarget.defaultTarget(withTdee: 2000)

    List {
        MacroTargetsSection(nutritionTarget: $nutritionTarget)
    }
}
