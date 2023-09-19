//
//  FlightsListView.swift
//  WildAvia
//
//  Created by Bagrat Arutyunov on 19.09.2023.
//

import SwiftUI

struct FlightsListView: View {
    @StateObject private var viewModel = FlightsListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                if viewModel.isLoaded {
                    VStack {
                        ForEach(viewModel.flights, id: \.searchToken) { flight in
                            NavigationLink {
                                FlightsDescriptionView(flight: flight)
                            } label: {
                                FlightCell(flight: flight)
                            }
                        }
                    }
                } else {
                   ProgressView()
                        .padding(.top, 250)
                }
            }
            .navigationTitle("Актуальные перелеты")
        }
        .accentColor(.black)
    }
}

#Preview {
    FlightsListView()
}
