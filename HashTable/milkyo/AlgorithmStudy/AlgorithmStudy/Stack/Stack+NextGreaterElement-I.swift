//
//  Stack+Stack+NextGreaterElement-I.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 5/1/23.
//

import Foundation

extension Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums2Count = nums2.count
        var result = [Int]()
        
        for num1 in nums1 {
            let index = nums2.firstIndex(of: num1)!
            var forResult = -1
            
            for int in index + 1 ..< nums2Count where nums2[int] > num1 {
                forResult = nums2[int]
                break
            }
            result.append(forResult)
        }
        return result
    }
}
