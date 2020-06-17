//
//  HealthCalculator.swift
//  SimpleApp
//
//  Created by Watanabe Toshinori on 2020/06/17.
//  Copyright © 2020 Watanabe Toshinori. All rights reserved.
//

import Foundation

class HealthCalculator {

    class func properWeight(height: Double) -> Double {
        round((pow(height / 100, 2) * 22) * 100) / 100
    }

    class func bmi(height: Double, weight: Double) -> Double {
        round((weight / pow(height / 100, 2)) * 100) / 100
    }

}
