//
//  FlightsService.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 09.06.2024.
//

import Foundation
import Combine

//Tickets for search main screen
struct FlightsResponse: Decodable {
    let ticketsOffers: [Flights]
    
    private enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}

protocol FlightsServiceProtocol {
    func fetchFlights() -> AnyPublisher<FlightsResponse, Error>
}

class FlightsService: FlightsServiceProtocol {
    
    private let apiClient: APIClient
        
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    func fetchFlights() -> AnyPublisher<FlightsResponse, Error> {
        return apiClient.request(url: URLs.searchScreenURL)
    }
}
