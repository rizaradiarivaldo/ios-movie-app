//
//  NetworkManager.swift
//  Movie
//
//  Created by Riza Radia Rivaldo on 17/09/24.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    private let API_KEY = "?api_key=6b8227faba5d25b66c9fa84a71f41c36&language=en-US&page=1"
    private let baseURL = "https://api.themoviedb.org/3"
    private let baseURLImage = "https://image.tmdb.org/t/p/w500"
    private init(){}
    

    
    func getMovies() async throws -> [Movie] {
        
        let path = "/movie/popular"
        guard let url = URL(string: "\(baseURL)\(path)\(API_KEY)") else {
            throw MVError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        print(url)
        do {
            let decoder = JSONDecoder()
            let moviesResponse = try decoder.decode(MoviesResponse.self, from: data)
            return moviesResponse.results
        } catch {
            print("error jing")
            throw MVError.invalidData
        }
    }
}
