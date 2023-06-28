// MARK: - https://leetcode.com/problems/find-center-of-star-graph

func findCenter(_ edges: [[Int]]) -> Int {
    var numSet = Set<Int>()
    
    for num in edges.flatMap { $0 } {
        if numSet.contains(num) { return num }
        numSet.insert(num)
    }
    
    return -1
}

