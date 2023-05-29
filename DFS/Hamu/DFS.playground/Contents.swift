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
