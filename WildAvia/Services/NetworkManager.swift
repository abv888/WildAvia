//
//  NetworkManager.swift
//  WildAvia
//
//  Created by Bagrat Arutyunov on 19.09.2023.
//

import Foundation

class NetworkManager {
    
    func fetchFlights(completion: (([Flight]?) -> Void)?) {
        
        let urlString = "https://vmeste.wildberries.ru/stream/api/avia-service/v1/suggests/getCheap"
        
        guard let apiURL = URL(string: urlString),
              let httpBody = "{\"startLocationCode\":\"LED\"}".data(using: .utf8) else {
            return
        }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.httpBody = httpBody
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error {
                print("\(error.localizedDescription)")
                completion?(nil)
                return
            }
            
            guard let data else {
                print("data is nil")
                completion?(nil)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Flights.self, from: data)
                completion?(result.flights)
            }
            catch {
                print(error)
            }
            
            completion?(nil)
        }
        
        task.resume()
    }
    
}
