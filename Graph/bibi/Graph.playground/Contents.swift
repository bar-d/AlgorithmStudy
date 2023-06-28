// MARK: - https://leetcode.com/problems/find-center-of-star-graph

func findCenter(_ edges: [[Int]]) -> Int {
    var numSet = Set<Int>()
    
    for num in edges.flatMap({ $0 }) {
        if numSet.contains(num) { return num }
        numSet.insert(num)
    }
    
    return -1
}

// MARK: - https://leetcode.com/problems/find-the-town-judge

func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    var trustOthers = Array(repeating: 0, count: n + 1)
    var isTrusted = Array(repeating: 0, count: n + 1)

    for pair in trust {
        let truster = pair[0]
        let trustee = pair[1]
        trustOthers[truster] += 1
        isTrusted[trustee] += 1
    }

    for i in 1...n {
        if trustOthers[i] == 0 && isTrusted[i] == n - 1 {
            return i
        }
    }

    return -1
}

// MARK: - https://leetcode.com/problems/all-paths-from-source-to-target

func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    var path: [Int] = [0]
    var allPaths: [[Int]] = []

    func dfs(_ node: Int) {
        if node == graph.count - 1 {
            allPaths.append(path)
            return
        }

        for neighbor in graph[node] {
            path.append(neighbor)
            dfs(neighbor)
            path.removeLast()
        }
    }

    dfs(0)
    return allPaths
}
