//
//  Movie.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import Foundation
import CoreData
import UIKit

protocol ManagedObjectConvertible {
    associatedtype ManagedObject

    /// Converts a conforming instance to a managed object instance.
    ///
    /// - Parameter context: The managed object context to use.
    /// - Returns: The converted managed object instance.
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject?
}

struct Movie : Codable, Equatable {

    // MARK: Properties
    
    var id : Int?
    var title : String?
    var overview : String?
    var release : String?
    var rating : Double?
    var posterUrl : String?
    var backUrl : String?
    var language : String?
    
    var posterImage : UIImage?
    var backImage : UIImage?
    
    var average : String {
        let value : String = String(format: "%.1f", rating ?? "N/A")
        return value
    }
    
    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case release = "release_date"
        case rating = "vote_average"
        case posterUrl = "poster_path"
        case backUrl = "backdrop_path"
        case language = "original_language"
    }
    
    // MARK: Equatable function
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }
}

struct MovieResults : Codable {
    var results : [Movie]?
}

extension Movie: ManagedObjectConvertible {
    
    /// implement the ManagedObjectConvertible in order to generate MovieEntity
    /// - Parameters: context - object space to manipulate and track changes to managed objects.
    /// - returns: A new NSManagedObject of MovieEntity
    ///
    func toManagedObject(in context: NSManagedObjectContext) -> MovieEntity? {
        let entityName = MovieEntity.entityName
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            NSLog("Can't create entity")
            return nil
        }
        
        let object = MovieEntity.init(entity: entityDescription, insertInto: context)
        
        object.id = id as NSNumber?
        object.title = title
        object.overview = overview
        object.language = language
        object.releaseDate = release
        object.backUrl = backUrl
        object.posterUrl = posterUrl
        object.poster = posterImage?.jpegData(compressionQuality: 1.0)
        object.backImage = backImage?.jpegData(compressionQuality: 1.0)
        
        return object
    }
}
