//
//  ContentView.swift
//  UnitsConversions
//
//  Created by Sam on 2019-11-27.
//  Copyright © 2019 Sailfish Studios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    /* State Variables */
    @State private var inputNumber = ""
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    
    let units = ["mL","L", "pt.", "qt.", "gal.", "fl.oz."]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Enter the value to convert.")
                    .font(.headline)
                
                TextField("Amount", text: $inputNumber)
                    .keyboardType(.decimalPad)
                    .padding(.all)
                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                
                Text("Select the input unit type")
                    .font(.headline)
                
                Picker("", selection: $inputUnit) {
                    ForEach(0 ..< units.count) {
                        Text("\(self.units[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Text("Select the output unit type")
                    .font(.headline)
                
                Picker("", selection: $outputUnit) {
                    ForEach(0 ..< units.count) {
                        Text("\(self.units[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Spacer()
            }
            .padding(.horizontal, 15)
            .navigationBarTitle("Volume Converter")
        }
    }
    
    func convertUnit(
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
