//
//  Greedy+kItemsWithMaximumSum.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 5/15/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/k-items-with-the-maximum-sum
    func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
        return min(numOnes, k) + (min(max(0, k - numOnes - numZeros), numNegOnes) * -1)
    }
}
