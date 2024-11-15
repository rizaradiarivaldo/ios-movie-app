//
//  MovieViewModel.swift
//  Movie
//
//  Created by Riza Radia Rivaldo on 17/09/24.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var alertItem: AlertItem?
    
    @Published var isLoading = false
   
    func getMovies() {
        isLoading = true
        
        Task {
            do {
                movies = try await NetworkManager.shared.getMovies()
                isLoading = false
            } catch {
                if let mvError = error as? MVError {
                    switch mvError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
