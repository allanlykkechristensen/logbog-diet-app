//
//  PersonalDetailsSection.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import SwiftUI

struct PersonalDetailsSection: View {
    @Binding var userProfile: UserProfile

    let weightOptions = Array(stride(from: 0.0, through: 300.0, by: 0.5))
    let heightOptions: [Int] = Array(0...250)

    var body: some View {

        Section("Personal Details") {

            HStack {
                Text("Name")
                Spacer()
                TextField("Username", text: $userProfile.name)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }

            Picker("Gender", selection: $userProfile.gender) {
                ForEach(Gender.allCases, id: \.self) { gender in
                    Text("\(gender.displayName)")
                }
            }

            DatePicker("Date of birth", selection: $userProfile.dateOfBirth, displayedComponents: .date)

            Picker("Weight (in kg)", selection: $userProfile.weight) {
                ForEach(0..<weightOptions.count, id: \.self) { index in
                    Text(String(format: "%.1f kg", weightOptions[index]))
                        .tag(weightOptions[index])
                }
            }

            Picker("Height (in cm)", selection: $userProfile.height) {
                ForEach(0..<heightOptions.count, id: \.self) { index in
                    Text("\(heightOptions[index]) cm")
                        .tag(heightOptions[index])
                }
            }

            HStack {
                Text("Body Mass Index (BMI)")
                Spacer()
                Text(String(format: "%d", userProfile.bmi))
            }

            HStack {
                Text("Basal Metabolic Rate (BMR)")
                Spacer()
                Text(String(format: "%d", userProfile.bmr))
            }

            Picker("Activity Level", selection: $userProfile.activityLevel) {
                ForEach(ActivityLevel.allCases, id: \.self) { level in
                    Text("\(level.rawValue)")
                }
            }

            HStack {
                Text("Total Daily Energy Expenditure (TDEE)")
                Spacer()
                Text(String(format: "%d", userProfile.tdee))
            }
        }
    }
}

#Preview {
    @Previewable @State var userProfile = UserProfile.defaultProfile()

    List {
        PersonalDetailsSection(userProfile: $userProfile)
    }
}
