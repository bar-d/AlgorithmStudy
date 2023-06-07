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

//MARK: - 145. Binary Tree Postorder Traversal

class Solution3 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        
        func dfs(node: TreeNode?) {
            guard let node = node else { return }
            
            dfs(node: node.left)
            dfs(node: node.right)
            result.append(node.val)
        }
        
        dfs(node: root)
        return result
    }
}

//MARK: - 230. Kth Smallest Element in a BST

class Solution4 {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var result = [Int]()
        
        func dfs(node: TreeNode?) {
            guard let node = node else { return }
            
            result.append(node.val)
            dfs(node: node.left)
            dfs(node: node.right)
            return
        }
        
        dfs(node: root)
        return result.sorted()[k - 1]
    }
}

//MARK: - 1110. Delete Nodes And Return Forest

class Solution {
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        var delete = Array(repeating: false, count: 1001)
        to_delete.forEach { delete[$0] = true }
        var result: [TreeNode?] = []
        
        func dfs(node: TreeNode?, isRoot: Bool) {
            guard let node = node else { return }
            if isRoot, !delete[node.val] { result.append(node) }
            var isRoot = false
            
            if delete[node.val] { isRoot = true }
            
            dfs(node: node.left, isRoot: isRoot)
            dfs(node: node.right, isRoot: isRoot)
            
            if delete[node.left?.val ?? 0] { node.left = nil }
            if delete[node.right?.val ?? 0] { node.right = nil }
        }
        
        dfs(node: root, isRoot: true)
        return result
    }
}
