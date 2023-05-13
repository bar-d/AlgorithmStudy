//MARK: - 2078. Two Furthest Houses With Different Colors

class Solution1 {
    func maxDistance(_ colors: [Int]) -> Int {
        var result = Int()
        let count = colors.count / 2 + colors.count % 2
        
        for i in 0..<count {
            for j in stride(from: colors.count - 1, through: count, by: -1) {
                if colors[i] != colors[j] {
                    result = max(result, j-i)
                    break
                }
            }
        }
        return result
    }
}
