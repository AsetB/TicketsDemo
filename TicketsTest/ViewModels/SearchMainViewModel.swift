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
    
    let flightService: FlightsServiceProtocol
    
    init(flightService: FlightsServiceProtocol = FlightsService()) {
        self.flightService = flightService
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
}
