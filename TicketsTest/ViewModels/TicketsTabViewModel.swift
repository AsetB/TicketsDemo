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
    
    let eventService: EventServiceProtocol
    
    init(eventService: EventServiceProtocol = EventService()) {
        self.eventService = eventService
        loadFrom()
        loadDestination()
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
