//
//  LatestMoviesViewController.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit

class LatestMoviesViewController : UITableViewController {
    
    // MARK: - Properties
    
    var movies : [Movie] = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var NoDataView: UIView!
    @IBOutlet weak var NoDataLabel: UILabel!
    @IBOutlet weak var viewSegmentedControl: UISegmentedControl!
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    
    // MARK: - Functions
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDataSource()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MovieTableViewCell.self)", for: indexPath) as! MovieTableViewCell
        
        cell.config(movie: movies[indexPath.row])

        return cell
    }
    
    /// If user tap in some row we will show the movie details
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationNavigationController = MovieDetailsViewController.instantiate()
        destinationNavigationController.movie = movies[indexPath.row]
        
        self.navigationController?.pushViewController(destinationNavigationController, animated: true)
    }
    
    
    // MARK: - Actions
    
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        updateDataSource()
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        updateDataSource()
    }
    
    // MARK: - Private Functions
    
    private func updateDataSource() {
        
        let index = viewSegmentedControl.selectedSegmentIndex
        movies.removeAll()
        
        if index == 0 {
            NoDataView.isHidden = true
            headerTitleLabel.text = "Stored Movies"
            NoDataLabel.text = "No Data Stored"
            movies = EntityDataManager.shared.getStoredMovies()
            
            updateViewToShow(isEmpty: movies.isEmpty)
            
        } else {
            NoDataView.isHidden = true
            headerTitleLabel.text = "Latest Movies"
            NoDataLabel.text = "No Data to Show"
            fetchData(path: Constants.latestMoviesUrl!)

        }
    }
    
    /// Call themoviedb API with the url required and update the table view with the result
    /// - Parameters: url of the endpoint
    ///
    private func fetchData(path: URL) {
        movies.removeAll()
        
        URLSession.shared.request(url: path, expecting: Movie.self) { [weak self] result in
            switch result {
            case .success(let movie):
                self?.movies.append(movie)
                self?.updateViewToShow(isEmpty: false)
                
            case .failure(let error):
                NSLog("There was an error while fetching data \(error)")
                self?.updateViewToShow(isEmpty: true)
            }
        }
    }
    
    
    /// Update view depending on the content of the list of objects
    /// - Parameters: url of the endpoint
    ///
    func updateViewToShow(isEmpty: Bool) {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.NoDataView.isHidden = !isEmpty
        }
    }
}
