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
    
    @Published var choosenDate: Date = Date.now {
        didSet {
            saveDate()
        }
    }
    
    let flightService: FlightsServiceProtocol
    
    init(flightService: FlightsServiceProtocol = FlightsService()) {
        self.flightService = flightService
        loadFrom()
        loadDestination()
        //Check text for cyrillic
        $from
            .sink { [weak self] value in
                self?.filterText()
            }
            .store(in: &cancellables)
        
        $destination
            .sink { [weak self] value in
                self?.filterText()
            }
            .store(in: &cancellables)
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
    
    private func filterText() {
        let cyrillicChars = CharacterSet(charactersIn: "абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ-")
        let filteredFrom = from.unicodeScalars.filter { cyrillicChars.contains($0) }
        let filteredFromString = String(String.UnicodeScalarView(filteredFrom))
        let filteredDestination = destination.unicodeScalars.filter { cyrillicChars.contains($0) }
        let filteredDestinationString = String(String.UnicodeScalarView(filteredDestination))
        
        if filteredFromString != from {
            DispatchQueue.main.async {
                self.from = filteredFromString
            }
            
        }
        if filteredDestinationString != destination {
            DispatchQueue.main.async {
                self.destination = filteredDestinationString
            }
        }
    }
    
    private func saveDate() {
        let formattedChoosenDate = choosenDateFormatted(for: choosenDate)
        UserDefaults.standard.set(formattedChoosenDate, forKey: "savedDate")
    }
}
