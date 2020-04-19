//
//  ContentView.swift
//  Converter
//
//  Created by Anastasia on 19.04.2020.
//  Copyright © 2020 Anastasia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tempOrigin = "10"
    
    @State private var indexT = 0
    let types = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var tempConverted: Double {
        let tOrigin = Double(tempOrigin) ?? 0
        let res = tOrigin * 9/5 + 32
        return res
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section {
                    TextField("Temperature", text:  $tempOrigin)
                }
                
                Section(header: Text("Input  unit")) {
                    Picker("Type", selection: $indexT) {
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
                     Picker("Type", selection: $indexT) {
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
