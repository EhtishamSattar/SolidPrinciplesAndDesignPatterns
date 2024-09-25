//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

import SwiftUI

struct FocusExampleView: View {
    // Focus state variable to manage the focus of the TextField
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            TextField("Enter text", text: .constant(""))
                .focused($isTextFieldFocused) // Binds the focus state to the TextField
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Toggle Focus") {
                isTextFieldFocused.toggle() // Toggles the focus on the TextField
            }
        }
        .padding()
    }
}

//#Preview {
//    FocusExampleView(isTextFieldFocused: true)
//}

