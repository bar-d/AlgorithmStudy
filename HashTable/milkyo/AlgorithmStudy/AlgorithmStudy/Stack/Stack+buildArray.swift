//
//  Stack+buildArray.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 5/1/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/build-an-array-with-stack-operations
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var result = [String]()
        var iteratorCounter = 0
        let lastTarget = target.last!
        
        for int in 1 ... n where iteratorCounter < lastTarget {
            iteratorCounter += 1
            
            if target.contains(int) {
                result.append("Push")
            } else {
                result.append("Push")
                result.append("Pop")
            }

        }
        
        return result
    }
}
