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
            tabBar.buttons["Zubereitung"].tap()
            snapshot("3Zubereitung")
        } else {
            XCUIDevice.shared.orientation = .landscapeLeft
            let tablesQuery = XCUIApplication().tables
            tablesQuery.buttons["Entdecken"].tap()
            snapshot("0Entdecken")
            tablesQuery.buttons["Liste"].tap()
            snapshot("1Liste")
            tablesQuery.buttons["Karte"].tap()
            snapshot("2Karte")
            tablesQuery.buttons["Zubereitung"].tap()
            snapshot("3Zubereitung")
        }
    }
}
