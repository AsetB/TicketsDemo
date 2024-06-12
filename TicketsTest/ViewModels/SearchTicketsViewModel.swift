//
//  SearchTicketsViewModel.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 10.06.2024.
//

import Foundation
import Combine

class SearchTicketsViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published var ticketsOffers: [Tickets] = []
    
    let ticketService: TicketServiceProtocol
    
    init(ticketService: TicketServiceProtocol = TicketService()) {
        self.ticketService = ticketService
    }
    
    func fetchTickets() {
        ticketService.fetchTickets()
            .sink { completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { response in
                self.ticketsOffers = response.tickets
            }
            .store(in: &cancellables)
    }
}
