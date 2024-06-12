//
//  Tickets.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 10.06.2024.
//

import Foundation

struct Tickets: Decodable, Identifiable {
    struct Price: Decodable {
        let value: Int
    }
    
    struct Departure: Decodable {
        let town: String
        let date: String
        let airport: String
    }
    
    struct Arrival: Decodable {
        let town: String
        let date: String
        let airport: String
    }
    
    let id: Int
    let badge: String?
    let price: Price
    let departure: Departure
    let arrival: Arrival
    let hasTransfer: Bool
    
    private enum CodingKeys: String, CodingKey {
        case price = "price"
        case id = "id"
        case badge = "badge"
        case departure = "departure"
        case arrival = "arrival"
        case hasTransfer = "has_transfer"
    }
}


      //"id": 100,
      //"badge": "Самый удобный",
//      "price": {
//        "value": 1999
//      },
      //"provider_name": "На сайте Купибилет",
      //"company": "Якутия",
//      "departure": {
//        "town": "Москва",
//        "date": "2024-02-23T03:15:00",
//        "airport": "VKO"
//      },
//      "arrival": {
//        "town": "Сочи",
//        "date": "2024-02-23T07:10:00",
//        "airport": "AER"
//      },
      //"has_transfer": false,
//      "has_visa_transfer": false,
//      "luggage": {
//        "has_luggage": false,
//        "price": {
//          "value": 1082
//        }
//      },
//      "hand_luggage": {
//        "has_hand_luggage": true,
//        "size": "55x20x40"
//      },
//      "is_returnable": false,
//      "is_exchangable": true
//    },
