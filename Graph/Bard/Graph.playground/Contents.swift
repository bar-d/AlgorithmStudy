// MARK: - https://leetcode.com/problems/find-center-of-star-graph/

func findCenter(_ edges: [[Int]]) -> Int {
    guard let first = edges.first else {
        return 0
    }
    
    guard let last = edges.last else {
        return 0
    }
    
    return Set(first).intersection(last).first!
}
