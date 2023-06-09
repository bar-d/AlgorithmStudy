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

//MARK: - 682. Baseball Game

class Solution3 {
    func calPoints(_ operations: [String]) -> Int {
        var stack = [Int]()
        
        operations.forEach { o in
            switch o {
            case "+":
                let first = stack.popLast()!
                let second = stack.last!
                stack.append(first)
                stack.append(first + second)
            case "D": stack.append(stack.last! * 2)
            case "C": stack.removeLast()
            default: stack.append(Int(o)!)
            }
        }
        return stack.reduce(0, +)
    }
}

//MARK: - 1441. Build an Array With Stack Operations

class Solution4 {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var result = [String]()
        var currentNum = 1
        for t in target {
            while currentNum < t {
                result.append("Push")
                result.append("Pop")
                currentNum += 1
            }
            result.append("Push")
            currentNum += 1
        }
        return result
    }
}

//MARK: - 2390. Removing Stars From a String

class Solution5 {
    func removeStars(_ s: String) -> String {
        var s = s.map { $0 }
        var result = [String.Element]()
        var starCount = 0
        
        while let char = s.popLast() {
            if char == "*" {
                starCount += 1
                continue
            }
            
            if starCount > 0 {
                starCount -= 1
                continue
            }
            
            result.append(char)
        }
        
        return String(result.reversed())
    }
}
