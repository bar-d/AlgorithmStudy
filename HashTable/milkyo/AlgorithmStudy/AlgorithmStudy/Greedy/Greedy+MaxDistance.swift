//
//  Greedy+Greedy+MaxDistance.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 5/15/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/two-furthest-houses-with-different-colors
    func maxDistance(_ colors: [Int]) -> Int {
        var result: Int = 0
        
        for (index) in colors.indices {
            for (inColor) in colors.indices.reversed() where colors[index] != colors[inColor] {
                result = max(result, inColor - index)
                break
            }
        }
        
        return result
    }
}
