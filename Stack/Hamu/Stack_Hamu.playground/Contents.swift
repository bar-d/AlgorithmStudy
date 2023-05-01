import Foundation

//MARK: - 496. Next Greater Element I

class Solution1 {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = [Int]()
        var nextGreater = [Int: Int]()
        var beforeNum = -1
        nums2.reversed().forEach { num in
            while let last = stack.last, last < num {
                stack.removeLast()
            }
            nextGreater[num] = stack.last ?? -1
            stack.append(num)
        }
        return nums1.map { nextGreater[$0] ?? -1 }
    }
}
