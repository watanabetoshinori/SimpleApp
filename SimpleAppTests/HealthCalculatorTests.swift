//
//  HealthCalculatorTests.swift
//  SimpleAppTests
//
//  Created by Watanabe Toshinori on 2020/06/17.
//  Copyright © 2020 Watanabe Toshinori. All rights reserved.
//

@testable import SimpleApp
import XCTest

class HealthCalculatorTests: XCTestCase {

    // MARK: - Tests

    func testBMI1() {
        let bmi = HealthCalculator.bmi(height: 150, weight: 38)
        XCTAssertEqual(bmi, 16.89)
    }

    func testBMI2() {
        let bmi = HealthCalculator.bmi(height: 160, weight: 50)
        XCTAssertEqual(bmi, 19.53)
    }

    func testBMI3() {
        let bmi = HealthCalculator.bmi(height: 170, weight: 68)
        XCTAssertEqual(bmi, 23.53)
    }

    func testBMI4() {
        let bmi = HealthCalculator.bmi(height: 180, weight: 88)
        XCTAssertEqual(bmi, 27.16)
    }

    func testProperWeight1() {
        let peoperWeight = HealthCalculator.properWeight(height: 150)
        XCTAssertEqual(peoperWeight, 49.5)
    }

    func testProperWeight2() {
        let peoperWeight = HealthCalculator.properWeight(height: 160)
        XCTAssertEqual(peoperWeight, 56.32)
    }

    func testProperWeight3() {
        let peoperWeight = HealthCalculator.properWeight(height: 170)
        XCTAssertEqual(peoperWeight, 63.58)
    }

    func testProperWeight4() {
        let peoperWeight = HealthCalculator.properWeight(height: 180)
        XCTAssertEqual(peoperWeight, 71.28)
    }

}
