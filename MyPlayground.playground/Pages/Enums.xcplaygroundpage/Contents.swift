//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

enum parentEnum {
    enum chilEnum {
        case one
        case two
        case three
        
        func say(){
            switch self {
            case .one:
                print("One")
            case .two:
                print("Two")
            case .three:
                print("three")
            }
        }
    }
}

var parent = parentEnum.chilEnum.one
parent.say()

