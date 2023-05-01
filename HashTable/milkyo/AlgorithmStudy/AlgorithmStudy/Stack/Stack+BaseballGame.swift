//
//  Stack+BaseballGame.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 5/1/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/baseball-game
    func calPoints(_ operations: [String]) -> Int {
        var stack = [Int]()
        
        for operation in operations {
            if let value = Int(operation) {
                stack.append(value)
            } else {
                switch operation {
                case "C":
                    stack.removeLast()
                case "D":
                    stack.append(stack.last! * 2)
                case "+":
                    let beforeIndex = stack.index(before: stack.endIndex) - 1
                    let sum = stack[stack.endIndex - 1] + stack[beforeIndex]
                    stack.append(sum)
                default:
                    break
                }
            }
        }
        
        return stack.reduce(0, +)
    }
}
