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
            HStack {
                Text("Calories (kcal)")
                Spacer()
                TextField("Calories", value: $nutritionTarget.calories, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
        }

        Section {
            HStack {
                Text("Proteins (g)")
                Spacer()
                if let macroPercentages = nutritionTarget.macroPercentages() {
                    Text(String(format: "%.1f%%", macroPercentages.proteinPercent))
                        .font(.footnote)
                }
                TextField("Proteins", value: $nutritionTarget.proteins, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }

            HStack {
                Text("Fats (g)")
                Spacer()
                if let macroPercentages = nutritionTarget.macroPercentages() {
                    Text(String(format: "%.1f%%", macroPercentages.fatPercent))
                        .font(.footnote)
                }
                TextField("Fats", value: $nutritionTarget.fats, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }

            HStack {
                Text("Carbs (g)")
                Spacer()
                if let macroPercentages = nutritionTarget.macroPercentages() {
                    Text(String(format: "%.1f%%", macroPercentages.carbPercent))
                        .font(.footnote)
                }
                TextField("Carbs", value: $nutritionTarget.carbs, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }

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
