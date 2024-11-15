//
//  ContentView.swift
//  Movie
//
//  Created by Riza Radia Rivaldo on 15/09/24.
//

import SwiftUI

struct MoviesView: View {
    @StateObject var viewModel = MoviesViewModel()
    let items = Array(1...20)  // Example data
    @State var selected: Int?
    
    
    // Define a grid with 4 columns
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                Text("loading")
            } else {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(viewModel.movies) { movie in
                        Card(movie: movie)
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                viewModel.getMovies()
            }
        }
    }
}

#Preview {
    MoviesView()
}
