import Foundation

//MARK: - 496. Next Greater Element I

class Solution1 {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = [Int]()
        var nextGreater = [Int: Int]()
        nums2.reversed().forEach { num in
            while let last = stack.last, last < num {
                stack.removeLast()
            }
            nextGreater[num] = stack.last ?? -1
            stack.append(num)
        }
        return nums1.map { nextGreater[$0] ?? -1 }
    }
}

//MARK: - 94. Binary Tree Inorder Traversal

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution2 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func visit(node: TreeNode?) {
            guard let node = node else { return }
            if let node = node.left { visit(node: node) }
            result.append(node.val)
            if let node = node.right { visit(node: node) }
        }
        
        visit(node: root)
        return result
    }
}
