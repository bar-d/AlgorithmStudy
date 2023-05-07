import Foundation

class Solution2 {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var answer: [Int] = []
        let evens = nums.filter { $0 % 2 == 0 }
        let odds = nums.filter { $0 % 2 == 1 }
        
        for (even, odd) in zip(evens, odds) {
            answer.append(even)
            answer.append(odd)
        }
        
        return answer
    }
}
