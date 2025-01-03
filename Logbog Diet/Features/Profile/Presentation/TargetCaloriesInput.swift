//
//  TargetCaloriesInput.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 03/01/2025.
//
import SwiftUI

struct TargetCaloriesInput: View {
    @Binding var nutritionTarget: NutritionTarget

    var body: some View {

        HStack {
            Text("Target Calories (kcal)")
            Spacer()
            TextField(
                "Calories",
                value: Binding(
                    get: { nutritionTarget.calories },
                    set: { newCalories in
                        nutritionTarget.calories = newCalories
                        nutritionTarget.updateGoalPercentage()
                    }
                ),
                formatter: NumberFormatter()
            )
#if os(iOS)
            .keyboardType(.numberPad)
#endif
            .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    @Previewable @State var nutritionTarget = NutritionTarget(tdee: 2000, calories: 2500)

    List {
        TargetCaloriesInput(nutritionTarget: $nutritionTarget)
    }
}
