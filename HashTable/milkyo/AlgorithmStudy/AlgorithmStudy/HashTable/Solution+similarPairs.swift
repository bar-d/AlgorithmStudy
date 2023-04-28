//
//  Solution+similarPairs.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 4/23/23.
//

import Foundation

extension Solution {
    func similarPairs(_ words: [String]) -> Int {
        var result = 0
        
        for (index, word) in words.enumerated() {
            for inindex in index + 1 ..< words.count where Set(word) == Set(words[inindex]) {
                result += 1
            }
        }
        
        return result
    }
}
