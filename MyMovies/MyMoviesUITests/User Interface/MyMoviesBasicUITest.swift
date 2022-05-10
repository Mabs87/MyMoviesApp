//
//  MyMoviesBasicUITest.swift
//  MyMoviesUITests
//
//  Created by Beltrán, Miguel on 10/05/22.
//

import XCTest

class MyMoviesBasicUITest : MyMoviesUITests {
    
    // Setup function to prepare the environment
    override func setUp() {
        super.setUp()
        app.launch()
        
    }
    
    func testHomeView() throws {
        
        // UI tests basic for Home View
        app.tables["Stored Movies, No Data Stored"].buttons["Latest"].tap()
        app.tables.buttons["Saved"].tap()
        
        let element = app.tables.firstMatch
        element.swipeDown()
        element.swipeUp()
        
    }
    
    func testPopularView() throws {
        // UI tests basic for Popular View
    
        let app = XCUIApplication()
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Popular"].tap()
        
        
        let element = app.tables.firstMatch
        element.swipeDown()
        element.swipeUp()
        
    }
    
    
    func testUpcomingView() throws {
        
        // UI tests basic for Upcoming View
    
        let app = XCUIApplication()
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Upcoming"].tap()
        
        
        let element = app.tables.firstMatch
        element.swipeDown()
        element.swipeUp()
        
    }
}
