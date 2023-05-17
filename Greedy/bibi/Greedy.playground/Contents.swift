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
