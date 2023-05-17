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
