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

// MARK: - https://leetcode.com/problems/all-paths-from-source-to-target/description/

func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    let length = graph.count - 1
    
    var stack: [Int] = []
    var result: [[Int]] = []
    
    func dfs(_ n: Int) {
        guard n != length else {
            result.append(stack + [length])
            return
        }
        for i in graph[n] {
            stack.append(n)
            dfs(i)
            stack.removeLast()
        }
    }
    
    dfs(0)
    
    return result
}

// MARK: - https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/description/

func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var graph = Array(repeating: false, count: n)
    var result: [Int] = []
    
    for i in 0..<edges.count {
        graph[edges[i][1]] = true
    }
    
    for i in 0..<n {
        if graph[i] == false {
            result.append(i)
        }
    }
    
    return result
}
