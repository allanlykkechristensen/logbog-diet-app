//
//  MacroPresetPicker.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 03/01/2025.
//
import SwiftUI

struct MacroPresetPicker: View {

    @State private var selectedPreset: MacroPreset?
    var applyPreset: ((MacroPreset) -> Void)

    let macroPresets: [MacroPreset] = [
        MacroPreset(name: "Strength Training", proteinRatio: 0.35, fatRatio: 0.25, carbRatio: 0.40),
        MacroPreset(name: "Endurance Training", proteinRatio: 0.20, fatRatio: 0.25, carbRatio: 0.55),
        MacroPreset(name: "Fat Loss", proteinRatio: 0.40, fatRatio: 0.30, carbRatio: 0.30),
        MacroPreset(name: "Bulking", proteinRatio: 0.30, fatRatio: 0.20, carbRatio: 0.50),
        MacroPreset(name: "Keto", proteinRatio: 0.20, fatRatio: 0.70, carbRatio: 0.10)
    ]

    var body: some View {
        Picker("Preset", selection: Binding<MacroPreset?>(
            get: { selectedPreset },
            set: { newPreset in
                selectedPreset = newPreset
                if let preset = newPreset {
                    applyPreset(preset)
                }
            }
        )) {
            Text("Select a Preset").tag(MacroPreset?.none)
            ForEach(macroPresets, id: \.name) { preset in
                Text(preset.name).tag(preset as MacroPreset?)
            }
        }
    }
}
