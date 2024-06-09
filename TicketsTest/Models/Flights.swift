//
//  Flights.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import Foundation

struct Flights: Decodable, Identifiable {
    struct Price: Decodable {
        let value: Int
    }
    
    let id: Int
    let title: String
    let timeRange: [String]
    let price: Price
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case timeRange = "time_range"
        case price = "price"
        case id = "id"
    }
}
