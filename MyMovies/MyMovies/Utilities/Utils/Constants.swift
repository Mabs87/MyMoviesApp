//
//  Constants.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import Foundation

struct Constants {
    
    // MARK: - static Properties
    
    static let apiKey = "427298bca8e42e4468dea38b4b01c0f9"
    
    static let latestMoviesUrl = URL(string: "http://api.themoviedb.org/3/movie/latest?api_key=\(apiKey)")
    static let popularMoviesUrl = URL(string: "http://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)")
    static let upcomingMoviesUrl = URL(string: "http://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")
    static let hostImageUrl = "http://image.tmdb.org/t/p/w500/"
}
