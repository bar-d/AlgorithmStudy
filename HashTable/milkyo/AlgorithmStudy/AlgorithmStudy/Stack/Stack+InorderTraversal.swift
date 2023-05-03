//
//  Stack+InorderTraversal.swift
//  AlgorithmStudy
//
//  Created by Milkyo on 5/1/23.
//

import Foundation

extension Solution {
    // https://leetcode.com/problems/binary-tree-inorder-traversal/
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        return traversal(root)
    }
    
    func traversal(_ node: TreeNode) -> [Int] {
        var result = [Int]()
        
        if let leftNode = node.left {
            result.append(contentsOf: traversal(leftNode))
        }
        
        result.append(node.val)
        
        if let rightNode = node.right {
            result.append(contentsOf: traversal(rightNode))
        }
        
        return result
    }
}

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
