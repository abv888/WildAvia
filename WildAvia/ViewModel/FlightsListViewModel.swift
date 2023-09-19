//
//  FlightsListViewModel.swift
//  WildAvia
//
//  Created by Bagrat Arutyunov on 19.09.2023.
//

import Foundation

class FlightsListViewModel: ObservableObject {
    @Published var flights: [Flight] = []
    @Published var isLoaded = false
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        NetworkManager().fetchFlights { flightData in
            if let flightData {
                DispatchQueue.main.async {
                    self.flights = flightData
                    self.isLoaded = true
                }
                
            }
        }
    }
}
