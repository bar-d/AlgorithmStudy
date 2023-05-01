//
//  Stack+removeStars.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 5/1/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/removing-stars-from-a-string
    func removeStars(_ s: String) -> String {
        return s.reduce(into: "") { partialResult, char in
            if char != "*" {
                partialResult.append(char)
            } else {
                partialResult.removeLast()
            }
        }
    }
}
