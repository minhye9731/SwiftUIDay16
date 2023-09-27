//
//  ContentView.swift
//  WeSplit
//
//  Created by 강민혜 on 9/23/23.
//

import SwiftUI

struct ContentView: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = "Harry"
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotalAmount: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    let currencyFormatter = FloatingPointFormatStyle<Double>.Currency.currency(code: Locale.current.currency?.identifier ?? "USD")
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused) // 해당 Textfield에 amountIsFocused 상태값을 적용

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }

                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
//                        ForEach(tipPercentages, id: \.self) {
//                            Text($0, format: .percent)
//                        }
                        ForEach(0..<101) { // 3) give it a wider range of options – everything from 0% to 100%
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink) // 3) Change the tip percentage picker to show a new screen rather than using a segmented control
                } header: {
                    Text("How much tip fo you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: currencyFormatter)
                } header: {
                    Text("Amount per person") // 1) Add a header to the third section, saying “Amount per person”
                }
                
                // 2) Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.

                Section {
                    Text(grandTotalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Grand Total")
                }
                
                
//                Button("Tap Count: \(tapCount)") {
//                    self.tapCount += 1
//                }
//
//                Section {
//                    TextField("Enter your name", text: $name)
//                    Text("Your name is \(name)")
//                }
//
//                Picker("Select your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//
//                Section {
//                    Text("(1) Hello, world!")
//                    Text("(2) Hello, world!")
//                    Text("(3) Hello, world!")
//                    Text("(4) Hello, world!")
//                    Text("(5) Hello, world!")
//                    Text("(6) Hello, world!")
//                }
//
//                Section {
//                    Text("(7) Hello, world!")
//                    Text("(8) Hello, world!")
//                    Text("(9) Hello, world!")
//                    Text("(10) Hello, world!")
//                    Text("(11) Hello, world!")
//                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.automatic)
            
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
