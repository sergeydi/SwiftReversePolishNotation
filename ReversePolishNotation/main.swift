//
//  main.swift
//  ReversePolishNotation
//
//  Created by Sergey Didanov on 10.12.16.
//  Copyright © 2016 Sergey Didanov. All rights reserved.
//


import Foundation

let inputString = "3 + 4 * 2 / ( 1 - 5 ) ^ 2"
var outputString = ""
var stack = Stack()
let operationsPriority: [String:Int] = ["(":1,")":1, "+":2,"-":2,"*":3,"/":3,"^":5]

// Convert input string to array and read each charecter
var stringArray = inputString.components(separatedBy: " ")
for character in stringArray {
    
    switch character {
    case _ where character.isEqualsToRegexp(regexpPattern: "^[1-9]\\d*\\.?\\d*$"): outputString += "\(String(character)!) "
    case "(": stack.push(character)
    case ")":
        while stack.peek() != "(" {
            if let function = stack.pop() {
                outputString += "\(function) "
            }
        }
        stack.pop()
    case _ where character.isEqualsToRegexp(regexpPattern: "^[-+*^\\/]$"):
        if !stack.isEmpty {
            while operationsPriority[character]! <= operationsPriority[stack.peek()!]! {
                if let function = stack.pop() {
                    outputString += "\(function) "
                }
            }
        }
        stack.push(character)
    default: print("Incorrect input string"); exit(0)
    }
}

// Build output string
while !stack.isEmpty {
    if let function = stack.pop() {
        outputString += "\(function) "
    }
}
print(outputString.removeLastChar())

stringArray = outputString.components(separatedBy: " ")
for character in stringArray {
    switch character {
    case _ where character.isEqualsToRegexp(regexpPattern: "^[1-9]\\d*\\.?\\d*$"): stack.push(character)
    case _ where character.isEqualsToRegexp(regexpPattern: "^[-+*^\\/]$"):
        guard let op2 = Double(stack.pop()!) else { exit(0) }
        guard let op1 = Double(stack.pop()!) else { exit(0) }
        switch character {
        case "+": stack.push(String(op1 + op2))
        case "-": stack.push(String(op1 - op2))
        case "*": stack.push(String(op1 * op2))
        case "/": stack.push(String(op1 / op2))
        case "^": stack.push(String(describing: pow(Decimal(op1), Int(op2))))
        default: exit(0)
        }
    default: print("Incorrect input string"); exit(0)
    }
}

print("result: ", stack.pop()!)
