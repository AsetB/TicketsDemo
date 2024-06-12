//
//  TicketService.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 10.06.2024.
//

import Foundation
import Combine

struct TicketsResponse: Decodable {
    let tickets: [Tickets]
}

protocol TicketServiceProtocol {
    func fetchTickets() -> AnyPublisher<TicketsResponse, Error>
}

class TicketService: TicketServiceProtocol {
    
    private let apiClient: APIClient
        
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    func fetchTickets() -> AnyPublisher<TicketsResponse, Error> {
        return apiClient.request(url: URLs.ticketsScreenURL)
    }
}
