//
//  MovieTableViewCell.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit

class MovieTableViewCell : UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var movieitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    // MARK: - Functions
    
    func config(movie: Movie) {
        movieitleLabel.text = movie.title
        movieDescriptionLabel.text = movie.overview
        
    }
    
}
