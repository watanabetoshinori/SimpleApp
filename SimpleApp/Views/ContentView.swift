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
                    TextField("Weight (kg)", text: $viewModel.weight)
                    Button("Calculate", action: viewModel.calculation)
                        .frame(maxWidth: .infinity)
                    Button("Clear", action: viewModel.clear)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.red)
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
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
