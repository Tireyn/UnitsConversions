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
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let units = ["mL","L", "pt.", "qt.", "gal.", "fl.oz."]
    
    var outputNumber: String {
        let amountToConvert = Double(inputNumber) ?? 0
        let input = units[inputUnit]
        let output = units[outputUnit]
        
        var inputVolume: Measurement<UnitVolume>
        var outputVolume: Measurement<UnitVolume>
        
        switch input {
        case "mL":
            inputVolume = Measurement(value: amountToConvert, unit: UnitVolume.milliliters)
        case "L":
            inputVolume = Measurement(value: amountToConvert, unit: UnitVolume.liters)
        case "pt.":
            inputVolume = Measurement(value: amountToConvert, unit: UnitVolume.pints)
        case "qt.":
            inputVolume = Measurement(value: amountToConvert, unit: UnitVolume.quarts)
        case "gal.":
            inputVolume = Measurement(value: amountToConvert, unit: UnitVolume.gallons)
        case "fl.oz.":
            inputVolume = Measurement(value: amountToConvert, unit: UnitVolume.fluidOunces)
        default:
            inputVolume = Measurement(value: amountToConvert, unit: UnitVolume.milliliters)
        }
        
        switch output {
        case "mL":
            outputVolume = inputVolume.converted(to: UnitVolume.milliliters)
        case "L":
            outputVolume = inputVolume.converted(to: UnitVolume.liters)
        case "pt.":
            outputVolume = inputVolume.converted(to: UnitVolume.pints)
        case "qt.":
            outputVolume = inputVolume.converted(to: UnitVolume.quarts)
        case "gal.":
            outputVolume = inputVolume.converted(to: UnitVolume.gallons)
        case "fl.oz.":
            outputVolume = inputVolume.converted(to: UnitVolume.fluidOunces)
        default:
            outputVolume = inputVolume.converted(to: UnitVolume.milliliters)
        }
        
        return MeasurementFormatter().string(from: outputVolume)
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Enter the value to convert.")
                    .font(.headline)
                
                TextField("Amount", text: $inputNumber)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
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
                
                HStack {
                    Text("The converted value is")
                    Text("\(outputNumber)")
                        .font(.headline)
                }
                .padding(.top, 15)
                
                Spacer()
            }
            .padding(.horizontal, 15)
            .navigationBarTitle("Volume Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
