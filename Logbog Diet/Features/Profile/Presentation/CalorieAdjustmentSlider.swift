//
//  CalorieAdjustmentSlider.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 03/01/2025.
//
import SwiftUI

struct CalorieAdjustmentSlider: View {
    @Binding var nutritionTarget: NutritionTarget

    var body: some View {
        VStack(alignment: .leading) {
            Text("Calorie Adjustment (\(String(format: "%.0f", nutritionTarget.goalPercentage))%)")
            HStack {
                Text("-25% (Cutting)")
                Slider(
                    value: Binding(
                        get: { nutritionTarget.goalPercentage },
                        set: { newGoalPercentage in
                            nutritionTarget.goalPercentage = newGoalPercentage
                            nutritionTarget.updateCalories()
                        }
                    ),
                    in: -25...25,
                    step: 1
                )
                Text("+25% (Bulking)")
            }
        }
    }
}

#Preview {
    @Previewable @State var nutritionTarget = NutritionTarget(tdee: 2000, goalPercentage: 10.0)

    List {
        CalorieAdjustmentSlider(nutritionTarget: $nutritionTarget)
    }
}
