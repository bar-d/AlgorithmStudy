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

//MARK: - 94. Binary Tree Inorder Traversal

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

//MARK: - 1441. Build an Array With Stack Operations

class Solution4 {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var index = 0
        var result = [String]()

        for i in 1...n {
            if index == target.count { break }
            result.append("Push")
            if target[index] == i {
                index += 1
            } else {
                result.append("Pop")
            }
        }
        return result
    }
}

//MARK: - 2390. Removing Stars From a String

class Solution5 {
    func removeStars(_ s: String) -> String {
        var result = [String]()
        for char in s {
            if char == "*" {
                if result.last != "*" {
                    result.removeLast()
                }
            } else {
                result.append(String(char))
            }
        }
        return result.joined()
    }
}
