import Foundation

//MARK: - 965. Univalued Binary Tree

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution1 {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        var result = true
        var compareVal = root?.val
        func dfs(node: TreeNode?) {
            guard let node = node else { return }
            if compareVal != node.val { result = false }
            
            dfs(node: node.left)
            dfs(node: node.right)
        }
        
        dfs(node: root)
        return result
    }
}

//MARK: - 463. Island Perimeter

class Solution2 {
    func findIndex(_ grid: [[Int]]) -> (row: Int, column: Int)? {
        for rowIndex in 0..<grid.count {
            if let columnIndex = grid[rowIndex].firstIndex(of: 1) {
                return (row: rowIndex, column: columnIndex)
            }
        }
        return nil
    }
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        guard let index = findIndex(grid) else { return 0 }
        let pX = [0, -1, 0, 1], pY = [-1, 0, 1, 0]
        let maxR = grid.count - 1, maxC = grid[0].count - 1
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var result = 0
        visited[index.0][index.1] = true
        
        func dfs(row: Int, column: Int) {
            for i in 0...3 {
                var tempColumn = column + pY[i]
                var tempRow = row + pX[i]
                
                if tempRow < 0 || tempColumn < 0 || tempColumn > maxC || tempRow > maxR {
                    result += 1
                    continue
                }

                if grid[tempRow][tempColumn] == 1 && !visited[tempRow][tempColumn] {
                    visited[tempRow][tempColumn] = true
                    dfs(row: tempRow, column: tempColumn)
                } else {
                    result += visited[tempRow][tempColumn] ? 0 : 1
                }
            }
        }
        
        dfs(row: index.0, column: index.1)
        return result
    }
}

let solution = Solution2()
print(solution.islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]))
