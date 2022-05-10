//
//  MovieEntity.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 09/05/22.
//

import CoreData
import UIKit

protocol ModelConvertible {
    associatedtype Movie

    /// Converts a conforming instance to a data model instance.
    /// - Returns: The converted data model instance.
    func toModel() -> Movie?
}

@objc(MovieEntity)
class MovieEntity : NSManagedObject {

    // MARK: NSManaged Properties
    
    @NSManaged var id : NSNumber?
    @NSManaged var title : String?
    @NSManaged var overview : String?
    @NSManaged var releaseDate : String?
    @NSManaged var rating : String?
    @NSManaged var language : String?
    @NSManaged var poster : Data?
    @NSManaged var posterUrl : String?
    @NSManaged var backImage : Data?
    @NSManaged var backUrl : String?
    
}

extension MovieEntity: ModelConvertible {
    
    static var entityName = "MovieEntity"
    
    // MARK: - function ModelConvertible
    
    /// Converts a MovieEntity instance to a Movie instance.
    /// - Returns: The converted Movie instance.
    func toModel() -> Movie? {
        return Movie(id: id as? Int,
                     title: title,
                     overview: overview,
                     release: releaseDate,
                     posterUrl: posterUrl,
                     backUrl: backUrl,
                     language: language,
                     posterImage: UIImage(data: poster ?? Data()),
                     backImage: UIImage(data: backImage ?? Data()))
    }
}
