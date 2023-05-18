// MARK: - https://leetcode.com/problems/counting-bits/description/

func countBits(_ n: Int) -> [Int] {
    var result: [Int] = []
    
    for i in 0...n {
        let oneCount = String(i, radix: 2)
            .map { String($0) }
            .filter { $0 == "1" }
            .count
        
        result.append(oneCount)
    }
    
    return result
}
