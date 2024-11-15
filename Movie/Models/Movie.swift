//
//  Movies.swift
//  Movie
//
//  Created by Riza Radia Rivaldo on 17/09/24.
//

import Foundation



struct Movie: Decodable, Identifiable {
    var id: Int
    let title: String
    let release_date: String
    let poster_path: String
}

struct MoviesResponse: Decodable {
    let page: Int
    let results: [Movie]
}

struct MockData {
    static let sampleMovie = Movie(id: 1, title: "Sounds Good", release_date: "2024-12-08", poster_path: "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg")
}
