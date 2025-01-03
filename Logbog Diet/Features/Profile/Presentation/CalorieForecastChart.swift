//
//  CalorieForecastChart.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 03/01/2025.
//
import SwiftUI
import Charts

struct CalorieForecastChart: View {

    @Binding var currentWeight: Double
    @Binding var calorieTarget: Int
    @Binding var tdee: Int

    var daysToForecast: Int = 90

    var body: some View {
        Section("Body Weight Forecast") {
            Chart(forecastData()) { dataPoint in
                LineMark(
                    x: .value("Date", dataPoint.date, unit: .day),
                    y: .value("Weight (kg)", dataPoint.weight)
                )
                .foregroundStyle(.blue)

                // Display value only for the first day of each month
                if isFirstDayOfMonth(date: dataPoint.date) {
                    PointMark(
                        x: .value("Date", dataPoint.date, unit: .day),
                        y: .value("Weight (kg)", dataPoint.weight)
                    )
                    .annotation(position: .top) {
                        Text(String(format: "%.1f kg", dataPoint.weight))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading) {
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel()
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) {
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel(format: .dateTime.month(.abbreviated))
                }
            }
            .frame(height: 300)
            .padding()
        }
    }

    // Generate forecast data
    private func forecastData() -> [CalorieForecast] {
        let startDate = Date()
        let dailyDeficit = calorieTarget - tdee
        let weightChangePerDay = Double(dailyDeficit) / NutritionConstants.caloriesPerKg

        var data: [CalorieForecast] = []
        var currentWeight = self.currentWeight

        for day in 0..<daysToForecast {
            let date = Calendar.current.date(byAdding: .day, value: day, to: startDate)!
            currentWeight += weightChangePerDay
            data.append(CalorieForecast(date: date, weight: currentWeight))
        }

        return data
    }

    private func isFirstDayOfMonth(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(.day, from: date) == 1
    }
}

#Preview {

    @Previewable @State var currentWeight = 99.5
    @Previewable @State var calorieTarget = 2200
    @Previewable @State var tdee = 2500

    List {
        CalorieForecastChart(
            currentWeight: $currentWeight,
            calorieTarget: $calorieTarget,
            tdee: $tdee)
    }
}
