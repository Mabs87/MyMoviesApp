//
//  Movie.swift
//  MyMovies
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import Foundation


struct Movie : Codable {

    // MARK: Variables
    
    let id : Int?
    var title : String?
    var overview : String?
    var release : String?
    var rating : Double?
    var poster : String?
    var backImage : String?
    var language : String?
    
    var average : String {
        let value : String = String(format: "%.1f", rating ?? "N/A")
        return value
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case release = "release_date"
        case rating = "vote_average"
        case poster = "poster_path"
        case backImage = "backdrop_path"
        case language = "original_language"
    }
}

struct MovieResults : Codable {
    var results : [Movie]?
    var page : Int?
    var total_pages : Int?
}
