//
//  UpcomingMoviesViewController.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit

class UpcomingMoviesViewController : MoviesTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(path: Constants.upcomingMoviesUrl!)
    }
        
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = UIViewController()
//        vc.view.backgroundColor = .systemGray
//        
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
}
