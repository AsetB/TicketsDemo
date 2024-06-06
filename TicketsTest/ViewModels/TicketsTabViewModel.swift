//
//  TicketsTabViewModel.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import Foundation
import Combine

class TicketsTabViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var eventsArray: [Events] = []
    
    let eventService: EventServiceProtocol
    
    init(eventService: EventServiceProtocol = EventService()) {
        self.eventService = eventService
    }
    
    func fetchEvents() {
        eventService.fetchEvents()
            .sink { completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { response in
                self.eventsArray = response.offers
            }
            .store(in: &cancellables)

    }
}
