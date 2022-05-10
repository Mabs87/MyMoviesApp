//
//  MyMoviesUITests.swift
//  MyMoviesUITests
//
//  Created by Beltrán, Miguel on 08/05/22.
//

import XCTest

class MyMoviesUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    var launchArguments : [String] {
        get {
            return []
        }
    }
    
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app.launchArguments.append("UITesting")
        app.launchArguments.append(contentsOf: self.launchArguments)
    }
}
