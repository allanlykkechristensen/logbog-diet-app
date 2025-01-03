//
//  CalorieForecast.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 03/01/2025.
//
import Foundation

struct CalorieForecast: Identifiable {
    let id: UUID = UUID()
    let date: Date
    let weight: Double
}
