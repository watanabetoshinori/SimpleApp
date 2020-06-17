//
//  ContentView.swift
//  SimpleApp
//
//  Created by Watanabe Toshinori on 2020/06/17.
//  Copyright © 2020 Watanabe Toshinori. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Height (cm)", text: $viewModel.height)
                        .accessibility(identifier: "HeightField")

                    TextField("Weight (kg)", text: $viewModel.weight)
                        .accessibility(identifier: "WeightField")

                    Button("Calculate", action: {
                        self.viewModel.calculation()
                        self.dismissKeyboard()
                    })
                        .frame(maxWidth: .infinity)
                        .accessibility(identifier: "CalculateButton")

                    Button("Clear", action: {
                        self.viewModel.clear()
                        self.dismissKeyboard()
                    })
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.red)
                        .accessibility(identifier: "ClearButton")
                }

                Section {
                    HStack {
                        Text("Proper Weight")
                        Spacer()
                        Text(viewModel.properWeight)
                    }
                    HStack {
                        Text("Diff Weight")
                        Spacer()
                        Text(viewModel.diffWeight)
                    }
                    HStack {
                        Text("BMI")
                        Spacer()
                        Text(viewModel.bmi)
                    }
                }
            }
            .navigationBarTitle("Health Calculations", displayMode: .inline)
        }
        .accessibility(identifier: "ContentView")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
