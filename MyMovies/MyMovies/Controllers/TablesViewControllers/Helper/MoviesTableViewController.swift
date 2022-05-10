//
//  MoviesTableViewController.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit

class MoviesTableViewController : UITableViewController {
    
    // MARK: - Properties
    
    var movies : MovieResults = MovieResults()
    
    
    // MARK: - Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let result = movies.results?.count else { return 0}
        return result
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MovieTableViewCell.self)", for: indexPath) as! MovieTableViewCell
        
        if let item = movies.results?[indexPath.row] {
            cell.config(movie: item)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destinationNavigationController = MovieDetailsViewController.instantiate()
        destinationNavigationController.movie = movies.results?[indexPath.row]
        
        self.navigationController?.pushViewController(destinationNavigationController, animated: true)
    }
    
    
    /// Call themoviedb API with the url required and update the table view with the result
    /// - Parameters: url of the endpoint
    ///
    func fetchData(path: URL) {
        
        URLSession.shared.request(url: path, expecting: MovieResults.self) { [weak self] result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                NSLog("There was an error while fetching data \(error)")
            }
        }
    }
}
