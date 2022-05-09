//
//  MovieTableViewCell.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit

class MovieTableViewCell : UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    // MARK: - func
    func config(movie: Movie) {
        movieitleLabel.text = movie.title
        movieDescriptionLabel.text = movie.overview
        
        /// Request the poster image from original URL
//        if let path = tvShow.image?.medium {
//            RemoteImageView.shared.getImage(path: path) { [weak self] (data) in
//                if let imageData = data, let image = UIImage(data: imageData) {
//                    self?.showImage.image = image
//                }
//            }
//        }
        
    }
    
}
