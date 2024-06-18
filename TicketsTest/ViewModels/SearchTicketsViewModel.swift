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
    
    @Published var from: String = "" {
        didSet {
            saveFrom()
        }
    }
    @Published var destination: String = "" {
        didSet {
            saveDestination()
        }
    }
    @Published var choosenDate: String = ""
    
    let ticketService: TicketServiceProtocol
    
    init(ticketService: TicketServiceProtocol = TicketService()) {
        self.ticketService = ticketService
        loadFrom()
        loadDestination()
        loadDate()
    }
    
    func loadDate() {
        if let savedDate = UserDefaults.standard.string(forKey: "savedDate") {
            choosenDate = savedDate
        }
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

    func loadRoutes() {
        loadFrom()
        loadDestination()
    }
    
    private func saveDestination() {
        UserDefaults.standard.set(destination, forKey: DestinationKey.destination.rawValue)
    }
    
    private func saveFrom() {
        UserDefaults.standard.set(from, forKey: DestinationKey.from.rawValue)
    }
    
    func loadDestination() {
        if let savedDestination = UserDefaults.standard.string(forKey: DestinationKey.destination.rawValue) {
            destination = savedDestination
        }
    }
    
    func loadFrom() {
        if let savedFrom = UserDefaults.standard.string(forKey: DestinationKey.from.rawValue) {
            from = savedFrom
        }
    }
}
