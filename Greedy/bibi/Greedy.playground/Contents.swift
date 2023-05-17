import Foundation

// problem 1 - 2078. Two Furthest Houses With Different Colors
class Solution1 {
    func maxDistance(_ colors: [Int]) -> Int {
        var left = 0
        var right = colors.count - 1
        var last = colors.count - 1
        
        while colors[0] == colors[right] {
            right -= 1
        }
        
        while colors[left] == colors[last] {
            left += 1
        }
        
        return max(right, last - left)
    }
}

// problem 2 - 2224. Minimum Number of Operations to Convert Time
class Solution2 {
    func convertTime(_ current: String, _ correct: String) -> Int {
        
        func getTotalMinutes(_ times: [Int]) -> Int {
            let hours = times[0]
            let minutes = times[1]
            return hours * 60 + minutes
        }
        
        let currentMinutes = getTotalMinutes(current.split(separator: ":").map { Int($0)! })
        let correctMinutes = getTotalMinutes(correct.split(separator: ":").map { Int($0)! })
        
        var diff = correctMinutes - currentMinutes
        
        var result = 0
        let minutes = [60, 15, 5, 1]
        
        for minute in minutes {
            // 현재 분 단위로 나눈 횟수를 결과에 더함
            result += diff / minute
            // 현재 분 단위로 나눈 나머지를 다음 계산을 위해 저장
            diff %= minute
        }
        
        return result
    }
}

// problem 3 - 2600. K Items With the Maximum Sum
class Solution3 {
    func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
        if k == 0 { return 0 }
        return min(k, numOnes) - max(0, k - numOnes - numZeros)
    }
}

// problem 4 - 1963. Minimum Number of Swaps to Make the String Balanced
class Solution4 {
    func minSwaps(_ s: String) -> Int {
        var swaps = 0
        var imbalance = 0
        
        for char in s {
            if char == "[" {
                imbalance += 1
            } else {
                imbalance -= 1
                
                if imbalance < 0 {
                    swaps += 1
                    imbalance = 1
                }
            }
        }
        return swaps
    }
}

// problem 5 - 1338. Reduce Array Size to The Half
class Solution5 {
    func minSetSize(_ arr: [Int]) -> Int {
        
        var numberCounts = [Int: Int]()
        
        for num in arr {
            numberCounts[num] = numberCounts[num, default: 0] + 1
        }
        
        let frequencies = numberCounts.values.sorted(by: >)
        
        var remainingCount = arr.count / 2
        var index = 0
        
        while remainingCount > 0 {
            remainingCount -= frequencies[index]
            index += 1
        }
        
        return index
    }
}
