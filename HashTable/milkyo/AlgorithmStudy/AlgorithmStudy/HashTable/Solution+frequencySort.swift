//
//  Solution+frequencySort.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 4/21/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/sort-characters-by-frequency/
    func frequencySort(_ s: String) -> String {
        var result = [Character: Int]()
        
        for s in s {
            if result[s] != nil {
                result[s]! += 1
            } else {
                result[s] = 1
            }
        }

        return result
            .sorted { $0.value > $1.value  }
            .map { String(repeating: $0.key, count: $0.value) }
            .joined()
    }
}
