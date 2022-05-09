//
//  PopularMoviesViewController.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit

class PopularMoviesViewController : MoviesTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(path: Constants.popularMoviesUrl!)
    }
        
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let destinationNavigationController = MovieDetailsViewController.instantiate()
//        destinationNavigationController.movie = movies.results?[indexPath.row]
//        
//        self.navigationController?.pushViewController(destinationNavigationController, animated: true)
//    }
    
}
