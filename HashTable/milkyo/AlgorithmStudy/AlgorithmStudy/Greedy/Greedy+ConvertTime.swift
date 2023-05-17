//
//  Greedy+convertTime.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 5/15/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/minimum-number-of-operations-to-convert-time/
    func convertTime(_ current: String, _ correct: String) -> Int {
        let currentToMinute = convertToMinute(current)
        let correctToMinute = convertToMinute(correct)
        var remain = correctToMinute - currentToMinute
        
        var result = 0
        
        result += remain / 60
        remain %= 60
        
        result += remain / 15
        remain %= 15
        
        result += remain / 5
        remain %= 5
        
        result += remain
        
        return result
    }
    
    private func convertToMinute(_ hour: String) -> Int {
        return Int(hour.prefix(2))! * 60 + Int(hour.suffix(2))!
    }
}
