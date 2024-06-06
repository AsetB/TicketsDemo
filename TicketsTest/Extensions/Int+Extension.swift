//
//  Int+Extension.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import Foundation

extension Int {
    func getFormattedCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSize = 3
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: self as NSNumber) ?? ""
    }
}
