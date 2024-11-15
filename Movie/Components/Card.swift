//
//  Card.swift
//  Movie
//
//  Created by Riza Radia Rivaldo on 19/09/24.
//

import SwiftUI

struct Card: View {
    var movie: Movie
    var isLoading: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 160)
                        .clipped()
                } else {
                    ProgressView()
                        .frame(minHeight: 160)
                }
            }
            .frame(minHeight: isLoading ? 160 : 0)
            
            
            VStack(alignment: .leading, spacing: 0){
                Text(movie.title)
                    .foregroundColor(.white)
//                    .fontWeight(.light)
                    .padding(.top, 5)
                
                Text(movie.release_date.prefix(4))
                    .foregroundColor(.white)
                    .font(.footnote)
//                    .fontWeight(.)
                    .padding(.vertical, 2)
            }
            .padding(.horizontal, 8)
        }
    }
}


#Preview {
    Card(movie: MockData.sampleMovie)
}
