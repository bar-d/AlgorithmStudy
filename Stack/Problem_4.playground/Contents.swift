// 1441. Build an Array With Stack Operations
// https://leetcode.com/problems/build-an-array-with-stack-operations/description/

class Solution {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var result = [String]()
        var current = 0
        var point = target.count
        let push = "Push"
        let pop = "Pop"
        
        for i in 1...n {
            if current < point {
                if target[current] == i {
                    result.append(push)
                    current += 1
                } else {
                    result.append(push)
                    result.append(pop)
                }
            } else {
                return result
            }
        }
        return result
    }
}
