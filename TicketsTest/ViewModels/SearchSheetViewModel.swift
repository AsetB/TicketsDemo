//
//  SearchSheetViewModel.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 17.06.2024.
//

import Foundation
import Combine

class SearchSheetViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
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
    @Published var isSearchMainViewPresented: Bool = false
    
    init() {
        //route load
        loadFrom()
        loadDestination()
        
        //Check text for cyrillic
        $from
            .dropFirst(4)
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink {
                [weak self] value in
                self?.filterText()
                self?.textDidChange()
            }
            .store(in: &cancellables)
        
        $destination
            .dropFirst(4)
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink {
                [weak self] value in
                self?.filterText()
                self?.textDidChange()
            }
            .store(in: &cancellables)
        
    }
    
    private func textDidChange() {
        let cyrillicChars = CharacterSet(charactersIn: "абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ-")
        let fromFiltered = from.unicodeScalars.allSatisfy { cyrillicChars.contains($0) }
        let destinationFiltered = destination.unicodeScalars.allSatisfy { cyrillicChars.contains($0) }
        
        
        if fromFiltered && destinationFiltered && !from.isEmpty && !destination.isEmpty {
            isSearchMainViewPresented = true
        } else {
            isSearchMainViewPresented = false
        }
    }
    //Cache for enterd routes
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
    
    //Text filtering
    private func filterText() {
        if !from.isEmpty && !destination.isEmpty {
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
    }
}
