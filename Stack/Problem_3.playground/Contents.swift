// 682. Baseball Game
// https://leetcode.com/problems/baseball-game/

class Solution {
    func calPoints(_ operations: [String]) -> Int {
        var sums: [Int] = []
        for i in 0..<operations.count {
            switch operations[i] {
            case "+":
                sums.append(sums[sums.count - 1] + sums[sums.count - 2])
            case "D":
                sums.append(sums[sums.count - 1] * 2)
            case "C":
                sums.removeLast()
            default:
                sums.append(Int(operations[i]) ?? 0)
            }
        }

        return sums.reduce(0,+)
    }
}
