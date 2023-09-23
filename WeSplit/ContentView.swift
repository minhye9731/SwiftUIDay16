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
    
    var body: some View {
        NavigationView {
            Form {
                Button("Tap Count: \(tapCount)") {
                    self.tapCount += 1
                }
                
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
                Section {
                    Text("(1) Hello, world!")
                    Text("(2) Hello, world!")
                    Text("(3) Hello, world!")
                    Text("(4) Hello, world!")
                    Text("(5) Hello, world!")
                    Text("(6) Hello, world!")
                }
                
                Section {
                    Text("(7) Hello, world!")
                    Text("(8) Hello, world!")
                    Text("(9) Hello, world!")
                    Text("(10) Hello, world!")
                    Text("(11) Hello, world!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
