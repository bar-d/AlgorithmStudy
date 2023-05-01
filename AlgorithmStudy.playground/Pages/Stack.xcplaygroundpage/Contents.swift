import Foundation

//MARK: - 496. Next Greater Element I

class Solution1 {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict: [Int:Int] = [:]
        var stack: [Int] = []
        var ans: [Int] = []
        
        for num in nums2 {
            while let last = stack.last, num > last {
                dict[last] = num
                stack.removeLast()
            }
            stack.append(num)
        }
        
        for num in nums1 {
            ans.append(dict[num] ?? -1)
        }
        
        return ans
    }
}
