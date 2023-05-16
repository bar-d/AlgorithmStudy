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
