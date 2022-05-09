//
//  HomeViewController.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import UIKit

class HomeViewController : MoviesTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchData(path: Constants.latestMoviesUrl!)
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemRed
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
