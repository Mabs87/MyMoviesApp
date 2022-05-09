//
//  MovieDetailsViewController.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit
import Foundation

class MovieDetailsViewController : UIViewController {
    
    static let identifier = "MovieDetailsViewController"
    
    public var movie : Movie! = nil
    
    @IBOutlet weak var MovieTitleLabel: UILabel!
    @IBOutlet weak var MovieYearLabel: UILabel!
    @IBOutlet weak var MovieLanguageLabel: UILabel!
    @IBOutlet weak var MovieDurationLabel: UILabel!
    @IBOutlet weak var MovieReviewLabel: UILabel!
    @IBOutlet weak var MovieRatingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /// initial configuration of the View
    private func config() {
        
        configureNavigationBar()
        
        /// Setup all the outlets
        MovieTitleLabel.text = movie.title
        MovieReviewLabel.text = movie.overview
        MovieYearLabel.text = movie.release
        MovieRatingLabel.text = movie.average
        
        if let lng = movie.language {
            MovieLanguageLabel.text = "Language: \(lng)"
        }
        
        navigationItem.title = movie.title
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    /// This function helps to setup the navigation bar icons and actions
    private func configureNavigationBar() {
//        let listOfFavorites = TvShowsFavoritesHandler.shared.getFavoritesList()
        var buttonIcon = UIImage(systemName: "star")
        var rightBarButton = UIBarButtonItem()
        
//        if listOfFavorites.contains(televisionShow) {
//            let deleteAction = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTapped))
//            buttonIcon = UIImage(systemName: "star.fill")
//            rightBarButton = deleteAction
//
//        } else {
        let addAction = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTapped))
        rightBarButton = addAction
            
//        }
        
        rightBarButton.image = buttonIcon
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    /// This function gives the logic to execute when a gesture recognition is detected in Add action
    @objc private func addTapped(){
//        TvShowsFavoritesHandler.shared.addNewShow(item: televisionShow)
        print("Add Action")
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
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
