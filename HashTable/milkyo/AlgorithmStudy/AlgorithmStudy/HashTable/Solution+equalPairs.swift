//
//  Solution+equalPairs.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 4/23/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/equal-row-and-column-pairs/description/
    func equalPairs(_ grid: [[Int]]) -> Int {
        let rearrange = grid.indices.map { index in grid.map { $0[index] } }
        var result = 0
        
        for gridValue in grid {
            for rearrangeValue in rearrange {
                if gridValue == rearrangeValue {
                    result += 1
                }
            }
        }
        
        return result
    }
}
