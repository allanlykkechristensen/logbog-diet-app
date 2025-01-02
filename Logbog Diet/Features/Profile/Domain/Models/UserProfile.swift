//
//  UserProfile.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import Foundation

struct UserProfile: Codable, Equatable {
    var name: String
    var dateOfBirth: Date
    var weight: Double  // in kilograms
    var height: Int  // in centimeters
    var gender: Gender

    // Derived property: calculates BMI based on weight and height
    var bmi: Double? {
        guard height > 0 else { return nil }
        let heightInMeters = Double(height) / 100.0
        return weight / (heightInMeters * heightInMeters)
    }

    // Derived property: calculcates the Basal Metabolic Rate (BMR) based on weight, height, age and gender
    var bmr: Double? {
        let weightContribution = 10 * weight

        let heightContribution = 6.25 * Double(height)
        let ageContribution = 5.0 * Double(age)
        let genderContribution = if gender == .female { -161.0 } else { 5.0 }

        return weightContribution + heightContribution - ageContribution + genderContribution
    }

    // Derived property: calculates age based on `dateOfBirth`
    var age: Int {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: now)
        return ageComponents.year ?? 0
    }

    // Validations for domain rules
    func isValid() -> Bool {
        return !name.isEmpty && dateOfBirth <= Date() && weight > 0 && height > 0
    }

    // Convenience method for creating a default profile
    static func defaultProfile() -> UserProfile {
        return UserProfile(
            name: "",
            dateOfBirth: Date(),  // Default to the current date
            weight: 0.0,
            height: 0,
            gender: .unspecified
        )
    }
}

enum Gender: String, Codable, CaseIterable {
    case male
    case female
    case nonBinary
    case unspecified

    var displayName: String {
        switch self {
        case .male: return "Male"
        case .female: return "Female"
        case .nonBinary: return "Non-Binary"
        case .unspecified: return "Unspecified"
        }
    }
}
