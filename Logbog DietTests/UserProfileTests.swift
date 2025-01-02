//
//  UserProfileTests.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 02/01/2025.
//

import Testing
import Foundation
@testable import Logbog_Diet

struct UserProfileTests {

    @Test func testBmiCalculationWithValidValues() {
        let sut = UserProfile(name: "John Doe", dateOfBirth: Date(), weight: 70.0, height: 175, gender: .male)
        if let sutBmi = sut.bmi {
            let bmi = (sutBmi * 100).rounded() / 100
            #expect(bmi == 22.86)
        }
    }

    @Test func testBmiCalculationWithZeroHeight() {
        let sut = UserProfile(name: "John Doe", dateOfBirth: Date(), weight: 70.0, height: 0, gender: .male)

        #expect(sut.bmi == nil)
    }

    @Test func testAgeCalculationWithValidDateOfBirth() {
        let calendar = Calendar.current
        let dateOfBirth = calendar.date(byAdding: .year, value: -25, to: Date())!
        let sut = UserProfile(name: "John Doe", dateOfBirth: dateOfBirth, weight: 70.0, height: 175, gender: .male)

        #expect(sut.age == 25)
    }

    @Test("Calculate BMR for male") func testBmrCalculationForMale() {
        let calendar = Calendar.current
        let dateOfBirth = calendar.date(byAdding: .year, value: -25, to: Date())!
        let sut = UserProfile(name: "John Doe", dateOfBirth: dateOfBirth, weight: 70.0, height: 175, gender: .male)

        #expect(sut.bmr == 1673.75)
    }

    @Test("Calculate BMR for female") func testBmrCalculationForFemale() {
        let calendar = Calendar.current
        let dateOfBirth = calendar.date(byAdding: .year, value: -25, to: Date())!
        let sut = UserProfile(name: "Jane Doe", dateOfBirth: dateOfBirth, weight: 70.0, height: 175, gender: .female)

        #expect(sut.bmr == 1507.75)
    }
}
