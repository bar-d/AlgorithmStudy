import Foundation

// MARK: - 349. Intersection of Two Arrays

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let numberSet1: Set = Set(nums1)
        var numberSet2: Set = Set(nums2)
        return Array(numberSet2.intersection(numberSet1)).sorted()
    }
}
