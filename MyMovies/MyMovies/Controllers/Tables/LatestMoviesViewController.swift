//
//  LatestMoviesViewController.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit

class LatestMoviesViewController : UITableViewController {
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(path: Constants.latestMoviesUrl!)
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationNavigationController = MovieDetailsViewController.instantiate()
        destinationNavigationController.movie = movie
        
        self.navigationController?.pushViewController(destinationNavigationController, animated: true)
    }
    
    func fetchData(path: URL) {
        URLSession.shared.request(url: path, expecting: Movie.self) { [weak self] result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.movie = movie
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MovieTableViewCell.self)", for: indexPath) as! MovieTableViewCell
        
        if let item = movie {
            cell.config(movie: item)
        }
        
        return cell
    }
    
}
