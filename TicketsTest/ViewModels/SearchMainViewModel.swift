//
//  SearchMainViewModel.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 09.06.2024.
//

import Foundation
import Combine

class SearchMainViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published var flightsOffers: [Flights] = []
    
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
    
    let flightService: FlightsServiceProtocol
    
    init(flightService: FlightsServiceProtocol = FlightsService()) {
        self.flightService = flightService
        loadFrom()
        loadDestination()
    }
    
    func fetchFlights() {
        flightService.fetchFlights()
            .sink { completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { FlightsResponse in
                self.flightsOffers = FlightsResponse.ticketsOffers
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
