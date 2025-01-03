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
        Section("Calories Target") {
            CalorieAdjustmentSlider(nutritionTarget: $nutritionTarget)
            TargetCaloriesInput(nutritionTarget: $nutritionTarget)
        }
    }
}

#Preview {
    @Previewable @State var nutritionTarget = NutritionTarget.defaultTarget(withTdee: 2000)

    List {
        NutritionTargetSection(nutritionTarget: $nutritionTarget)
    }
}
