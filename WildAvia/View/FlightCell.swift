//
//  FlightCell.swift
//  WildAvia
//
//  Created by Bagrat Arutyunov on 19.09.2023.
//

import SwiftUI

struct FlightCell: View {
    private var flight: Flight
    let defaults = UserDefaults.standard
    @State private var isLiked = false
    
    init(flight: Flight) {
        self.flight = flight
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "airplane.departure")
                VStack(alignment: .leading) {
                    Text(flight.startCity)
                    Text(flight.startDate.convertDate())
                }
                Spacer()
                VStack {
                    Button(action: {
                        self.isLiked.toggle()
                        self.defaults.set(self.isLiked, forKey: self.flight.searchToken)
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                    }
                    Spacer()
                }
            }
            Color.gray
                .frame(width: 2)
            HStack {
                Image(systemName: "airplane.arrival")
                VStack(alignment: .leading) {
                    Text(flight.endCity)
                    Text(flight.endDate.convertDate())
                }
                Spacer()
                VStack {
                    Spacer()
                    Button(action: {}) {
                        HStack {
                            Text("\(flight.price)")
                            Text("₽")
                        }
                    }
                    .padding(8)
                    .background(.yellow)
                    .cornerRadius(8)
                }
            }
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 2)
        )
        .foregroundColor(.black)
        .padding(8)
        .onAppear {
            self.isLiked = defaults.bool(forKey: self.flight.searchToken)
        }
    }
}

#Preview {
    FlightCell(flight: Flight(startDate: "2023-09-21 00:00:00 +0000 UTC",
                              endDate: "0001-01-01 00:00:00 +0000 UTC",
                              startLocationCode: "LED",
                              endLocationCode: "MOW",
                              startCity: "Санкт-Петербург",
                              endCity: "Москва",
                              serviceClass: "",
                              seats: [Seat(passengerType: "", count: 0),
                                      Seat(passengerType: "", count: 0),
                                      Seat(passengerType: "", count: 1)],
                              price: 3450,
                              searchToken: "LED210923MOWY100",
                              isLiked: false))
}
