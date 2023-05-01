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

//MARK: - 682. Baseball Game

class Solution3 {
    func calPoints(_ operations: [String]) -> Int {
        var points: [Int] = []
        for operation in operations {
            switch operation {
            case "C":
                points.removeLast()
            case "D":
                points.append(points.last! * 2)
            case "+":
                points.append(points[points.count-1] + points[points.count-2])
            default:
                points.append(Int(operation)!)
            }
        }
        return points.reduce(0, +)
    }
}
