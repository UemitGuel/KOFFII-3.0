//
//  KOFFII_CGN_2_0UITests.swift
//  KOFFII CGN 2.0UITests
//
//  Created by Ümit Gül on 21.09.20.
//

import XCTest

class KOFFII_CGN_2_0UITests: XCTestCase {

    override func setUp() {
        super.setUp()

        let app = XCUIApplication()
        var launchArguments: [AnyHashable] = []

        launchArguments.append("-AppleInterfaceStyle")
        launchArguments.append("Dark")
        app.launchArguments = launchArguments as! [String]
        setupSnapshot(app)
        app.launch()
    }

    func testExample() throws {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            let tabBar = XCUIApplication().tabBars
            tabBar.buttons["Entdecken"].tap()
            snapshot("0Entdecken")
            tabBar.buttons["Liste"].tap()
            snapshot("1Liste")
            tabBar.buttons["Karte"].tap()
            snapshot("2Karte")
        } else {
            XCUIApplication().navigationBars.buttons["KOFFII CGN"].tap()
            
            let tablesQuery = XCUIApplication().tables
            tablesQuery.buttons["Top 3"].tap()
            snapshot("0Entdecken")
            XCUIApplication().navigationBars["Ümit´s Top 3"].buttons["BackButton"].tap()
            tablesQuery.buttons["Cafes"].tap()
            snapshot("1Liste")
            XCUIApplication().navigationBars["KOFFII CGN"].buttons["BackButton"].tap()
            tablesQuery.buttons["Map"].tap()
            snapshot("2Karte")
        }
    }
}
