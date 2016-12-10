//
//  Extansions.swift
//  ReversePolishNotation
//
//  Created by Sergey Didanov on 10.12.16.
//  Copyright © 2016 Sergey Didanov. All rights reserved.
//

import Foundation

extension String {
    
    // Check if current string equal to input regular expression
    func isEqualsToRegexp(regexpPattern: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: regexpPattern, options: [])
        return regex.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count)).count != 0
    }
    
    // Remove last character from the current string
    mutating func removeLastChar() -> String {
        self = self.substring(to: self.index(before: self.endIndex))
        return self
    }
}
