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
