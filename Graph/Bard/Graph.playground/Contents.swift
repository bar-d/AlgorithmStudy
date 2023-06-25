// MARK: - https://leetcode.com/problems/find-center-of-star-graph/

func findCenter(_ edges: [[Int]]) -> Int {
    guard let first = edges.first else {
        return 0
    }
    
    guard let last = edges.last else {
        return 0
    }
    
    return Set(first).intersection(last).first ?? 0
}

// MARK: - https://leetcode.com/problems/find-the-town-judge/description/

func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    var trusts = Array(repeating: 0, count: n + 1)
    var trusted = Array(repeating: 0, count: n + 1)
    
    for t in trust {
        trusts[t[0]] += 1
        trusted[t[1]] += 1
    }
    
    for i in 1...n {
        if trusts[i] == 0 && trusted[i] == n - 1 {
            return i
        }
    }
    
    return -1
}
