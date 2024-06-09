//
//  Font+Extension.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 04.06.2024.
//

import SwiftUI

extension Font {
    
    enum SFProDisplayWeights: String {
        case regular = "Regular"
        case medium = "Medium"
        case semibold = "Semibold"
        case mediumItalic = "MediumItalic"
    }
    
    static func addSFProDisplay(ofSize size: CGFloat, weight: SFProDisplayWeights = .regular) -> Font {
        return .custom("SFProDisplay-\(weight.rawValue)", size: size)
    }
}
