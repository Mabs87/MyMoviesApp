//
//  EntityDataManager.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 09/05/22.
//

import CoreData
import UIKit

/// This class provide functions to handle our EntityData from coredata
class EntityDataManager {
    
    // MARK: - Static properties
    
    static let shared = EntityDataManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    // MARK: - Functions
    
    /// This function will check the MovieEntities stored and then will parse and return an array of movie objects
    ///
    /// - returns: An array of movies stored
    ///
    func getStoredMovies() -> [Movie] {
        var movies : [Movie] = []
        
        let context : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: MovieEntity.entityName)
        
        do {
            let results : NSArray = try context.fetch(request) as NSArray
            
            for result in results {
                guard let movieFetched = result as? MovieEntity else { return movies }
                
                // parse from entity
                if let movieParsed = movieFetched.toModel() {
                    movies.append(movieParsed)
                }
                
            }
        } catch  {
            NSLog("fetch failed \(error.localizedDescription)")
        }
        
        return movies
    }
    
    
    /// This function will store a new MovieEntities from a new movie provided
    ///
    /// - Parameters: movie object to store
    ///
    func storeNewMovie(movie: Movie) {
        let context : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        // call the toManagedObject function to create a new entity and update Core Data
        _ = movie.toManagedObject(in: context)
        do {
            try context.save()
        } catch {
            NSLog("context save error \(error.localizedDescription)")
        }
    }
    
    
    /// This function will check the MovieEntities stored and then will delete the movie object provided
    ///
    /// - Parameters: movie object to delete
    ///
    func deleteStoredMovie(movie movieToDelete: Movie) {
        
        let context : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: MovieEntity.entityName)
        
        do {
            let results : NSArray = try context.fetch(request) as NSArray
            
            for result in results {
                guard let movieFetched = result as? MovieEntity else { return }
                
                if movieToDelete == movieFetched.toModel() {
                    context.delete(movieFetched)
                    
                    try context.save()
                    return
                }
            }
        } catch  {
            NSLog("Delete failed \(error.localizedDescription)")
        }
    }
    
    
}
