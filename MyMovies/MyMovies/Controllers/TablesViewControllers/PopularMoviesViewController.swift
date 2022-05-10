//
//  PopularMoviesViewController.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit

/// This class is inheriting all functionality from  MoviesTableViewController and it is open to define more functions and override existing ones with new functionality
class PopularMoviesViewController : MoviesTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Call the fetch data function in MoviesTableViewController with url for popular movies
        fetchData(path: Constants.popularMoviesUrl!)
    }
    
}
