//
//  Events.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 05.06.2024.
//

import Foundation

struct Events: Decodable, Identifiable {
    struct Price: Decodable {
        let value: Int
    }
    
    let id: Int
    let title: String
    let town: String
    let price: Price
}
