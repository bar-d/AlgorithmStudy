//
//  Greedy+minSetSize.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 5/15/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/reduce-array-size-to-the-half/
    func minSetSize(_ arr: [Int]) -> Int {
       var originalCount = arr.count
       let target = originalCount / 2
       var result = 0
       let sortedArr = arr
            .reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }
            .map { $0.value }
            .sorted(by: >)
        
        for value in sortedArr {
            originalCount -= value
            result += 1
            
            if originalCount <= target {
                break
            }
        }
        
        return result
    }
}
