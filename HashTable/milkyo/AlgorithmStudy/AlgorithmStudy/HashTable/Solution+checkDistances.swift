//
//  Solution+checkDistances.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 4/21/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/check-distances-between-same-letters/description/
    func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
        var result = [String.Element: Int]()
        
        let baseOffset = Character("a").asciiValue!
        
        for (index, s) in s.enumerated() {
            if result[s] != nil, index - 1 - result[s]! != distance[Int(s.asciiValue! - baseOffset)] {
                return false
            } else {
                result[s] = index
            }
        }
        
        return true
    }
}
