//
//  Solution+countWords.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 4/20/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/count-common-words-with-one-occurrence/
    func countWords(_ words1: [String], _ words2: [String]) -> Int {
        var dict1: [String: Int] = [:]
        var dict2: [String: Int] = [:]
        
        for string in words1 {
            if dict1[string] == nil {
                dict1[string] = 1
            } else {
                dict1[string]! += 1
            }
        }
        
        for string in words2 {
            if dict2[string] == nil {
                dict2[string] = 1
            } else {
                dict2[string]! += 1
            }
        }
        
        return dict1
            .filter { (key, value) in
                guard value == 1 else { return false }
                return dict2[key] == 1
            }
            .count
    }
}
