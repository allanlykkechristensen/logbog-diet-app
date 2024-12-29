//
//  NutritionTargetInput.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 29/12/2024.
//
import SwiftUI

struct NutritionTargetInput: View {
    let label: String
    @Binding var value: Int
    let percentage: Double?
    let formatter: NumberFormatter

    init(label: String, value: Binding<Int>, percentage: Double? = nil, formatter: NumberFormatter = NumberFormatter()) {
        self.label = label
        self._value = value
        self.percentage = percentage
        self.formatter = formatter
    }

    var body: some View {
        HStack {
            Text(label)
            Spacer()
            if let macroPercentage = percentage {
                Text(String(format: "%.1f%%", macroPercentage))
                    .font(.footnote)
            }

            TextField(label, value: $value, formatter: formatter)
#if os(iOS)
                .keyboardType(.numberPad)
#endif
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.trailing)

        }
    }
}
