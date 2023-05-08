//MARK: - 2578. Split With Minimum Sum

class Solution1 {
    func splitNum(_ num: Int) -> Int {
        var sortedNum = Array(String(num)).sorted()
        var num1 = "", num2 = ""
        
        for i in 0..<sortedNum.count {
            if i % 2 == 0 {
                num1 += String(sortedNum[i])
            } else {
                num2 += String(sortedNum[i])
            }
        }
        
        return Int(num1)! + Int(num2)!
    }
}
//MARK: - 349. Intersection of Two Arrays

class Solution3_1 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int:Bool]()
        for i in nums1 {
            dict[i] = true
        }
        var result = [Int]()
        for i in Set(nums2) {
            if let _ = dict[i] {
                result.append(i)
            }
        }
        return result
    }
}

class Solution3_2 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return Array(Set(nums1).intersection(nums2))
    }
}

