//
//  MoviesServiceHandler.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import Foundation

class MoviesServiceHandler {
    
    static public let shared = MoviesServiceHandler()
    
    /// This function will call AIP endpoint with the path provided and will return the data recived.
    ///
    /// - Parameters: path from the endpoint
    ///
    func getImage(path: String, completion: @escaping (Data?) -> Void) {
            
        let group = DispatchGroup()
        group.enter()
            
        if let url = URL(string: path) {
                
            DispatchQueue.global(qos: .utility).async {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }

                    DispatchQueue.main.async { /// execute on main thread since is for user interface
                        completion(data)
                    }
                }
                task.resume()
                group.leave()
                
            }
        }
    
        group.wait()
    }
}

