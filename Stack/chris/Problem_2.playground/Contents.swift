// 94. Binary Tree Inorder Traversal
// https://leetcode.com/problems/binary-tree-inorder-traversal/description/

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        var stack = [TreeNode]()
        var p = root
 
    while p != nil || !stack.isEmpty {
        if let t = p {
            stack.append(t)
            p = t.left
        } else {
            let t = stack.popLast()!
            list.append(t.val)
            p = t.right
        }
    }
 
    return list
    }
}
