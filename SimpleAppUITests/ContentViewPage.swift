//
//  ContentViewPage.swift
//  SimpleAppUITests
//
//  Created by Watanabe Toshinori on 2020/06/17.
//  Copyright © 2020 Watanabe Toshinori. All rights reserved.
//

import XCTest

class ContentViewPage {

    let identifier = "ContentView"

    let app: XCUIApplication

    var view: XCUIElement { app.otherElements[identifier] }

    var weight: String { weightField.value as? String ?? "" }

    var height: String { heightField.value as? String ?? "" }

    private var weightField: XCUIElement { view.textFields["WeightField"] }

    private var heightField: XCUIElement { view.textFields["HeightField"] }

    private var calculateButton: XCUIElement { view.buttons["CalculateButton"] }

    private var clearButton: XCUIElement { view.buttons["ClearButton"] }

    // MARK: - Initialize Page

    required init(app: XCUIApplication) {
        self.app = app

        wait(for: view)
    }

    // MARK: - Type Text

    func typeHeight(_ height: String) -> Self {
        heightField.tap()
        heightField.typeText(height)
        hideKeyboard()
        return self
    }

    func typeWeight(_ weight: String) -> Self {
        weightField.tap()
        weightField.typeText(weight)
        hideKeyboard()
        return self
    }

    // MARK: - Tap Buttons

    func tapCalculateButton() -> Self {
        calculateButton.tap()
        return self
    }

    func tapClearButton() -> Self {
        clearButton.tap()
        return self
    }

    // MARK: - Page functions

    func then(_ handler: (Self) -> Void) -> Self {
        handler(self)
        return self
    }

    func wait(for element: XCUIElement, timeout: TimeInterval = 5, file: StaticString = #file, line: UInt = #line) {
        if element.waitForExistence(timeout: timeout) == false {
            XCTFail("Failed to find \(element) after \(timeout) seconds.", file: file, line: line)
        }
    }

    func hideKeyboard() {
        app.tap()
        view.staticTexts.firstMatch.tap()
    }

}
