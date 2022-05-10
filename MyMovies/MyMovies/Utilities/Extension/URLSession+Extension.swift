//
//  URLSession+Extension.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 09/05/22.
//
import Foundation

extension URLSession {
    
    enum CustomError : Error {
        case invalidUrl
        case invalidData
    }
    
    // MARK: - Functions
    
    /// This is a generic request function that will return the parsed object expected
    /// - Parameters:
    ///     - url - URL for the endpoint required
    ///     - expecting object result to decode our response
    ///     - retryAttempts: Number of times to retry if request fails.
    /// - returns: escaping result wiith the data decoded or an Error
    ///
    func request<T: Codable>(url: URL?, retryAttempts : Int = 1, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        let shouldRetry = retryAttempts > 0
        
        let retryRequest = { [weak self] in
            NSLog("Retrying request...")
            self?.request(url: url,
                            retryAttempts: (retryAttempts-1),
                            expecting: expecting,
                            completion: completion)
        }
        
        guard let url = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        
        let task = self.dataTask(with: url) { data, _, error in
            
            guard let data = data else {
                if let error = error {
                    
                    if shouldRetry {
                        retryRequest()
                        
                    } else {
                        completion(.failure(error))
                    }
                    
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

