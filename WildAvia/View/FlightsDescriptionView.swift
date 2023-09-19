//
//  FlightsDescriptionView.swift
//  WildAvia
//
//  Created by Bagrat Arutyunov on 19.09.2023.
//

import SwiftUI

struct FlightsDescriptionView: View {
    private var flight: Flight
    @State private var isLiked = false
    
    init(flight: Flight) {
        self.flight = flight
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(systemName: "airplane.departure")
            Text("Город вылета - \(flight.startCity)")
            Text("Дата и время вылета - \(flight.startDate.convertDate())")
            Color.gray
                .frame(width: 2)
            Image(systemName: "airplane.arrival")
            Text("Город прилета - \(flight.endCity)")
            Text("Дата и время прилета \(flight.endDate.convertDate())")
            Spacer()
            VStack {
                HStack {
                    Text("Избранное")
                    Spacer()
                    Button(action: {
                        self.isLiked.toggle()
                        UserDefaults.standard.setValue(self.isLiked, forKey: self.flight.searchToken)
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                    }
                }
                HStack {
                    Text("Стоимость")
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
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
            )
        }
        .font(.system(size: 30))
        .padding(8)
        .foregroundColor(.black)
        .padding(8)
        .onAppear {
            self.isLiked = UserDefaults.standard.bool(forKey: self.flight.searchToken)
        }
        .navigationTitle("Описание")
    }
}

#Preview {
    FlightsDescriptionView(flight: Flight(
        startDate: "2023-09-21 00:00:00 +0000 UTC",
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
