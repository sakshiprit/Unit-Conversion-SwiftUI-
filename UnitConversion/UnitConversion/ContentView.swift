//
//  ContentView.swift
//  UnitConversion
//
//  Created by Sakshi Patil on 22/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let InputUnits = ["Meters", "Kilometers","Centimeters"]
    let OutputUnits = ["Meters", "Kilometers","Centimeters"]
    
    var conversion:Double {
        let inputValue = Double(inputNumber) ?? 0.0
        var outputValue = 0.0

        switch inputUnit {
        case 0:
            if (outputUnit == 0) {
                outputValue = inputValue
            } else  if (outputUnit == 1) {
                outputValue = inputValue / 1000
            } else  if (outputUnit == 2) {
                outputValue = inputValue * 100
            }
        case 1:
            if (outputUnit == 0) {
                outputValue = inputValue * 1000
            } else  if (outputUnit == 1) {
                outputValue = inputValue
            } else  if (outputUnit == 2) {
                outputValue = inputValue * 1000 * 100
            }

        case 2:
            if (outputUnit == 0) {
                outputValue = inputValue / 100
            } else  if (outputUnit == 1) {
                outputValue = inputValue / (1000 * 100)
            } else  if (outputUnit == 2) {
                outputValue = inputValue
            }
        default:
            print("")
        }
       
        return Double(outputValue)
    }

    var body: some View {
        Form {
            Section {
                TextField("Input number" , text:$inputNumber).keyboardType(.decimalPad)
            }
            
            Section {
                Picker("Units to convert", selection:$inputUnit){
                    ForEach(0..<InputUnits.count){
                        Text("\(self.InputUnits[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section {
                Picker("Units to convert into", selection:$outputUnit){
                    ForEach(0..<OutputUnits.count){
                        Text("\(self.OutputUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            
            Section {
                Text("\(conversion, specifier:"%.2f")")
                }
            }
        }
    }
        
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
  }

