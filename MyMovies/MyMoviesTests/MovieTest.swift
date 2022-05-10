//
//  MovieTest.swift
//  MyMoviesTests
//
//  Created by Beltrán, Miguel on 10/05/22.
//

import XCTest
@testable import MyMovies

class MovieTest : XCTestCase {
    
    var Spiderman: Movie!
    var Batman: Movie!
    var Matrix: Movie!
    
    override func setUp() {
        super.setUp()
        Spiderman = Movie(id: 0,
                          title: "Spiderman")
        Batman = Movie(id: 1,
                       title: "Batman")
        
        Matrix = Batman
    }
        
    override func tearDown() {
        super.tearDown()
        Spiderman = nil
        Batman = nil
    }
    
    func testEquatableDiferentObject() {
        XCTAssertFalse(Spiderman == Batman)
        
    }
    
    
    func testSameObject() {
        XCTAssertTrue(Matrix == Batman)
         
    }
    
}

