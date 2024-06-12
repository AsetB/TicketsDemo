//
//  DateFormatter.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 11.06.2024.
//

import Foundation

func formateDateString(fromString this: String) -> String? {
    let inputDateFormatter = DateFormatter()
    inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    guard let date = inputDateFormatter.date(from: this) else {
        return nil
    }
    
    let outputDateFormatter = DateFormatter()
    outputDateFormatter.dateFormat = "HH:mm"
    
    let formattedDateString = outputDateFormatter.string(from: date)
    return formattedDateString
}

func timeDifference(from startTime: String, to endTime: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    guard let startDate = dateFormatter.date(from: startTime),
          let endDate = dateFormatter.date(from: endTime) else {
        return nil
    }
    
    let interval = endDate.timeIntervalSince(startDate)
    
    let adjustedInterval = interval >= 0 ? interval : (interval + 24 * 60 * 60)
    
    let totalMinutes = Int(adjustedInterval) / 60
    let hours = totalMinutes / 60
    let minutes = totalMinutes % 60
    
    let roundedHours: Double
    if minutes <= 15 {
        roundedHours = Double(hours)
    } else if minutes <= 45 {
        roundedHours = Double(hours) + 0.5
    } else {
        roundedHours = Double(hours) + 1
    }
    
    if roundedHours == floor(roundedHours) {
        return String(format: "%.0fч", roundedHours)
    } else {
        return String(format: "%.1fч", roundedHours)
    }
}
