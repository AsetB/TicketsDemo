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

func currentDateFormatted(for date: Date) -> String? {
    //let date = Date()
    let dateFormatter = DateFormatter()
    
    //day and month
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "dd MMMM"
    let fullStringDate = dateFormatter.string(from: date)
    
    //month
    dateFormatter.dateFormat = "MMMM"
    let fullMonth = dateFormatter.string(from: date)
    let shortMonth = String(fullMonth.prefix(3))
    
    //day of the week
    dateFormatter.dateFormat = "E"
    let dayOfWeekString = dateFormatter.string(from: date).lowercased()
    
    let dateComponents = fullStringDate.components(separatedBy: " ")
    let formattedDate = "\(dateComponents[0]) \(shortMonth), \(dayOfWeekString)"
    
    return formattedDate
}

func choosenDateFormatted(for date: Date) -> String {
    //let date = Date()
    let dateFormatter = DateFormatter()
    
    //day and month
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "dd MMMM"
    let fullStringDate = dateFormatter.string(from: date)
    
    //month
    dateFormatter.dateFormat = "MMMM"
    let fullMonth = dateFormatter.string(from: date)
    
    let dateComponents = fullStringDate.components(separatedBy: " ")
    let formattedDate = "\(dateComponents[0]) \(fullMonth)"
    
    return formattedDate
}
