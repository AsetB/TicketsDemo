//
//  EventService.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 05.06.2024.
//

import Foundation
import Combine

struct EventResponse: Decodable {
    let offers: [Events]
}

protocol EventServiceProtocol {
    func fetchEvents() -> AnyPublisher<EventResponse, Error>
}

class EventService: EventServiceProtocol {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    func fetchEvents() -> AnyPublisher<EventResponse, Error> {
        return apiClient.request(url: URLs.mainScreenURL)
    }
    
    
}
