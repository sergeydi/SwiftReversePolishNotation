//
//  Structures.swift
//  ReversePolishNotation
//
//  Created by Sergey Didanov on 10.12.16.
//  Copyright © 2016 Sergey Didanov. All rights reserved.
//

import Foundation

// Standard Stack algorithm
public struct Stack {
    fileprivate var array = [String]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: String) {
        array.append(element)
    }
    
    public mutating func pop() -> String? {
        return array.popLast()
    }
    
    public func peek() -> String? {
        return array.last
    }
}
