import Foundation

//2078. Two Furthest Houses With Different Colors
class Solution1 {
    func maxDistance(_ colors: [Int]) -> Int {
        return Array(0..<colors.count)
            .map { index in
                for j in 0...index {
                    if colors[index] != colors[j] { return abs(index - j) }
                }
                return 0
            }
            .max() ?? 0
    }
}

//2224. Minimum Number of Operations to Convert Time
class Solution2 {
    func convertTime(_ current: String, _ correct: String) -> Int {
        var current = current.split(separator: ":").map { Int($0)! }.reduce(0) { $0 * 60 + $1 }
        let correct = correct.split(separator: ":").map { Int($0)! }.reduce(0) { $0 * 60 + $1 }
        let timeList = [1, 5, 15, 60]
        var count = 0
        
        while current != correct {
            count += 1
            var addTime = 1
            for (index, time) in timeList.enumerated() {
                addTime = time
                if current + time > correct {
                    addTime = timeList[index - 1]
                    break
                } else if current + time == correct {
                    return count
                }
            }
            current += addTime
        }
        
        return count
    }
}

//2600. K Items With the Maximum Sum
class Solution3 {
    func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
        var k = k, result = 0
        let map = [0 : 1, 1 : 0, 2 : -1]
        for (index, num) in [numOnes, numZeros, numNegOnes].enumerated() {
            if k == 0 { break }
            k -= num
            if k >= 0 {
                result += map[index]! * num
            } else if k < 0 {
                result += map[index]! * (num - abs(k))
                break
            }
        }
        
        return result
    }
}

//1963. Minimum Number of Swaps to Make the String Balanced
class Solution4 {
    func minSwaps(_ s: String) -> Int {
        var s = Array(s), left = 0, right = 0

        s.forEach { c in
            switch c {
                case "]":
                    if left > 0 { left -= 1 }
                    else { right += 1 }
                default:
                    left += 1
            }
        }
        return (right + 1)/2
    }
}
