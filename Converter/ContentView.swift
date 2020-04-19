//
//  ContentView.swift
//  Converter
//
//  Created by Anastasia on 19.04.2020.
//  Copyright © 2020 Anastasia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tempOrigin = "0"
    
    @State private var indexIn = 0
    @State private var indexRes = 1
    let types = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var tempConverted: Double {
        let tOrigin = Double(tempOrigin) ?? 0
        var res: Double = 0
        if indexIn == 0 && indexRes == 1 {
            res = tOrigin * 9/5 + 32
        }
        if indexIn == 0 && indexRes == 2 {
            res = tOrigin + 273.15
        }
        if indexIn == 1 && indexRes == 0 {
            res = (tOrigin - 32) * 5/9
        }
        if indexIn == 1 && indexRes == 2 {
            res = (tOrigin - 32) * 5/9 + 273.15
        }
        if indexIn == 2 && indexRes == 0 {
            res = tOrigin - 273.15
        }
        if indexIn == 2 && indexRes == 1 {
            res = (tOrigin - 273.15) * 9/5 + 32
        }
        return res
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(header: Text("Temperature")) {
                    TextField("Temperature", text:  $tempOrigin)
                }
                
                Section(header: Text("Input  unit")) {
                    Picker("Type", selection: $indexIn) {
                        ForEach(0..<types.count) {
                            Text("\(self.types[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("\(tempConverted, specifier: "%.2f")")
                }
                
                Section(header: Text("Result  unit")) {
                     Picker("Type", selection: $indexRes) {
                         ForEach(0..<types.count) {
                             Text("\(self.types[$0])")
                         }
                     }
                     .pickerStyle(SegmentedPickerStyle())
                 }
                
            }
            .navigationBarTitle("Converter")
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
