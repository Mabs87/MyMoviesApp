//
//  MovieDetailsViewController.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit
import Foundation
import CoreData

class MovieDetailsViewController : UIViewController {
    
    // MARK: - Properties
    
    static let identifier = "MovieDetailsViewController"
    public var movie : Movie! = nil
    
    // MARK: - Outlets
    
    @IBOutlet weak var MovieTitleLabel: UILabel!
    @IBOutlet weak var MovieYearLabel: UILabel!
    @IBOutlet weak var MovieLanguageLabel: UILabel!
    @IBOutlet weak var MovieReviewLabel: UILabel!
    @IBOutlet weak var MovieRatingLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backDropImage: UIImageView!
    
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    
    // MARK: - Private Functions
    
    /// initial configuration of the View
    private func config() {
        
        /// Setup all the outlets
        MovieTitleLabel.text = movie.title
        MovieReviewLabel.text = movie.overview
        MovieYearLabel.text = movie.release
        MovieRatingLabel.text = "Rating: \(movie.average)"
        
        /// get images from API
        if let posterUrl = movie.posterUrl {
            
            MoviesServiceHandler.shared.getImage(path: Constants.hostImageUrl + posterUrl) { (data) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    self.posterImage.image = image
                    self.movie.posterImage = image
                }
            }
        }
        
        if let backDropUrl = movie.backUrl {
            
            MoviesServiceHandler.shared.getImage(path: Constants.hostImageUrl + backDropUrl) { (data) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    self.backDropImage.image = image
                    self.movie.backImage = image
                }
            }
        }
        
        if let lng = movie.language {
            MovieLanguageLabel.text = "Language: \(lng)"
        }
        
        navigationItem.title = movie.title
    }
    
    /// This function helps to setup the navigation bar icons and actions
    private func configureNavigationBar() {

        let listOfSavedItems = EntityDataManager.shared.getStoredMovies()
        
        var buttonIcon = UIImage(systemName: "star")
        var rightBarButton = UIBarButtonItem()
        
        if listOfSavedItems.contains(movie) {
            let deleteAction = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTapped))
            buttonIcon = UIImage(systemName: "star.fill")
            rightBarButton = deleteAction
            
        } else {
            let addAction = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTapped))
            rightBarButton = addAction
            
        }
        
        rightBarButton.image = buttonIcon
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    // MARK: - Actions
    
    /// This function gives the logic to execute when a gesture recognition is detected in Add action
    @objc private func addTapped(){
        EntityDataManager.shared.storeNewMovie(movie: movie)
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
        
    }
    
    
    /// This function gives the logic to execute when a gesture recognition is detected in Add action
    @objc private func deleteTapped(){
        EntityDataManager.shared.deleteStoredMovie(movie: movie)
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star")
        
    }
    
    
}

// MARK: - Storyboard

extension MovieDetailsViewController {
    static func instantiate() -> MovieDetailsViewController {
        let vc = UIStoryboard(name: "MovieDetails", bundle: nil).instantiateViewController(
            withIdentifier: MovieDetailsViewController.identifier) as! MovieDetailsViewController
        return vc
    }
}
