import UIKit

/*
 https://leetcode.com/problems/next-greater-element-i/
 496. Next Greater Element I

 1. nums 1을 순환하면서 nums2에 해당하는 targetIndex 찾기
 2. targetIndex 기준으로 num1 보다 큰 num2 있는지 찾기
 3. 있다면 해당 숫자를 result에 포함
 4. 없다면 -1을 result에 포함
 */

func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result: [Int] = []

    for num1 in nums1 {
        var isGreater = false
        let targetIndex = nums2.firstIndex(of: num1) ?? 0

        for num2 in nums2[targetIndex..<nums2.count] {
            if num1 < num2 {

                isGreater = true
                result.append(num2)
                break
            }
        }

        if !isGreater {
            result.append(-1)
        }
    }

    return result
}
