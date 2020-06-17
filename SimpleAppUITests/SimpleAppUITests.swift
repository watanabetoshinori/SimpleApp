//
//  SimpleAppUITests.swift
//  SimpleAppUITests
//
//  Created by Watanabe Toshinori on 2020/06/17.
//  Copyright © 2020 Watanabe Toshinori. All rights reserved.
//

import XCTest

class SimpleAppUITests: XCTestCase {

    // MARK: - Setup

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    // MARK: - Tests

    func testCalculate() throws {
        let app = XCUIApplication()
        app.launch()

        ContentViewPage(app: app)
            .typeHeight("170")
            .typeWeight("68")
            .tapCalculateButton()
            .then { page in
                XCTAssertTrue(page.view.staticTexts["23.53"].exists)
                XCTAssertTrue(page.view.staticTexts["+4.42kg"].exists)
                XCTAssertTrue(page.view.staticTexts["63.58kg"].exists)
            }
    }

    func testClear() throws {
        let app = XCUIApplication()
        app.launch()

        ContentViewPage(app: app)
            .typeHeight("170")
            .typeWeight("68")
            .tapClearButton()
            .then { page in
                XCTAssertEqual(page.weight, "")
                XCTAssertEqual(page.height, "")
            }
    }

}
