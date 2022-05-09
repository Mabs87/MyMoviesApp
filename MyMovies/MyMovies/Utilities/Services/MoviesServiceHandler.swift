//
//  MoviesServiceHandler.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import Foundation

class MoviesServiceHandler {
    
    /// Singleton Instance
    static public let shared = MoviesServiceHandler()
 
    var request : NSMutableURLRequest = NSMutableURLRequest()
    let session = URLSession.shared
    
}

extension URLSession {
    
    enum CustomError : Error {
        case invalidUrl
        case invalidData
    }
    
    func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        
        let task = self.dataTask(with: url) { data, _, error in
            
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidData))
                }
                return
                
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
                
            } catch {
                completion(.failure(error))
                
            }
        
        }
        
        task.resume()
    }
}
