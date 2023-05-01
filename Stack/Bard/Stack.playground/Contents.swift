// MARK: - https://leetcode.com/problems/next-greater-element-i/description/

func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var array: [Int] = Array(repeating: -1, count: nums1.count)
    
    for i in 0..<nums1.count {
        for l in 0..<nums2.count {
            if nums1[i] == nums2[l] {
                for index in l..<nums2.count {
                    if nums2[index] > nums1[i] {
                        array[i] = nums2[index]
                        break
                    }
                }
            }
        }
    }
    
    return array
}

nextGreaterElement([4,1,2], [1,3,4,2])
