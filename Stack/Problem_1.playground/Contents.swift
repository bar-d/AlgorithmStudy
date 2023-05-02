// 496. Next Greater Element I
// https://leetcode.com/problems/next-greater-element-i/

class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
         var result = [Int]()
        
    for i in nums1 {
        let index = nums2.firstIndex(of: i)!
        if nums2[index...].filter { $0 > i }.count != 0 {
            result.append(nums2[index...].filter { $0 > i }[0])
        } else {
            result.append(-1)
        }
    }
    
    return result
    }
}
