//
//  MovieSearchView.swift
//  SwiftyMovieDB
//
//  Created by Christopher J. Roura on 11/7/20.
//

import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var movieSearchState = MovieSearchState()
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                SearchBarView(placeholder: "Search movies", text: self.$movieSearchState.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                
                List {
                    LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                        self.movieSearchState.search(query: self.movieSearchState.query)
                    }
                    
                    if self.movieSearchState.movies != nil {
                        ForEach(self.movieSearchState.movies!) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                    Text(movie.yearText)
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .onAppear {
                self.movieSearchState.startObserve()
            }
            .navigationBarTitle("Search")
        }
    }
}


struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
