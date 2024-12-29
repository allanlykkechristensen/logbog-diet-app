//
//  NutritionTargetRepository.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 29/12/2024.
//
protocol NutritionTargetRepository {
    func loadNutritionTarget() -> NutritionTarget?
    func saveNutritionTarget(_ target: NutritionTarget)
}
