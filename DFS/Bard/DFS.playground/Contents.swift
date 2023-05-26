// MARK: - https://leetcode.com/problems/univalued-binary-tree/description/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return checkValue(of: root, root.val)
    }
    
    func checkValue(of node: TreeNode?, _ value: Int) -> Bool {
        guard let node = node else {
            return true
        }
        
        if node.val != value {
            return false
        }
        
        return checkValue(of: node.left, value) && checkValue(of: node.right, value)
    }
}

// MARK: - https://leetcode.com/problems/island-perimeter/description/

func islandPerimeter(_ grid: [[Int]]) -> Int {
    var count = 0
    
    for row in 0..<grid.count {
        for column in 0..<grid[row].count {
            let currentCell = grid[row][column]
            
            if currentCell == 1 {
                if row == 0 || row == grid.count - 1 {
                    count += 1
                }
                
                if column == 0 || column == grid[row].count - 1 {
                    count += 1
                }
                
                if column - 1 >= 0 && grid[row][column - 1] == 0 {
                    count += 1
                }
                
                if column < grid[row].count - 1 && grid[row][column + 1] == 0 {
                    count += 1
                }
                
                if row - 1 >= 0 && grid[row - 1][column] == 0 {
                    count += 1
                }
                
                if row < grid.count - 1 && grid[row + 1][column] == 0 {
                    count += 1
                }
            }
        }
    }
    
    return count
}
