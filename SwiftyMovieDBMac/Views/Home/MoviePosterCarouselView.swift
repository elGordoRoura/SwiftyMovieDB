//
//  MoviePosterCarouselView.swift
//  SwiftyMovieDB
//
//  Created by Christopher J. Roura on 11/7/20.
//

import SwiftUI

struct MoviePosterCarouselView: View {
    
    let title: String
    let movies: [Movie]
    @Binding var selectedMovie: Movie?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal, 32)
            
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        MoviePosterCard(movie: movie)
                            .frame(width: 204, height: 306)
 
                            .onTapGesture {
                                self.selectedMovie = movie
                        }
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom)
            }
        }
        
    }
}

struct MoviePosterCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarouselView(title: "Now Playing", movies: Movie.stubbedMovies, selectedMovie: .constant(nil))
    }
}

