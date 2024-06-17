//
//  SearchSheetViewModel.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 17.06.2024.
//

import Foundation
import Combine

class SearchSheetViewModel: ObservableObject {
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
    
    init() {
        loadFrom()
        loadDestination()
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
