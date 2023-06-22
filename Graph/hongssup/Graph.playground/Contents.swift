// MARK: - https://leetcode.com/problems/find-center-of-star-graph/

func findCenter(_ edges: [[Int]]) -> Int {
    return edges[1].contains(edges[0][0]) ? edges[0][0] : edges[0][1]
}
