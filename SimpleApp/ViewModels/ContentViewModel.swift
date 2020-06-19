//
//  ContentViewModel.swift
//  SimpleApp
//
//  Created by Watanabe Toshinori on 2020/06/17.
//  Copyright © 2020 Watanabe Toshinori. All rights reserved.
//

import SwiftUI

class ContentViewModel: ObservableObject {

    @Published var height: String = ""

    @Published var weight: String = ""

    @Published var bmi: String = "-"

    @Published var properWeight: String = "-"

    @Published var diffWeight: String = "-"

    var isValid: Bool {
        guard let rawHeight = Double(height),
            let rawWeight = Double(weight),
            rawHeight > 0.0,
            rawWeight > 0.0 else {
            return false
        }

        return true
    }

    func calculation() {
        let rawHeight = Double(height) ?? 0.0
        let rawWeight = Double(weight) ?? 0.0

        let rawProperWeight = HealthCalculator.properWeight(height: rawHeight)
        let rawBMI = HealthCalculator.bmi(height: rawHeight, weight: rawWeight)

        properWeight = String(format: "%0.2fkg", rawProperWeight)
        diffWeight = String(format: "%+0.2fkg", rawWeight - rawProperWeight)
        bmi = String(format: "%0.2f", rawBMI)
    }

    func clear() {
        height = ""
        weight = ""
        properWeight = "-"
        diffWeight = "-"
        bmi = "-"
    }

}
