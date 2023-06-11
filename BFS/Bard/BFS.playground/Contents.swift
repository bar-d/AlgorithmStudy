// MARK: - https://leetcode.com/problems/maximum-depth-of-n-ary-tree/

public class Node {
    public var val: Int
    public var children: [Node]
    
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
    
    init(_ val: Int, _ children: [Node]) {
        self.val = val
        self.children = children
    }
}

func maxDepth(_ root: Node?) -> Int {
    guard let root = root else {
        return 0
    }
    
    if root.children.isEmpty {
        return 1
    }
    
    var depth = 0
    
    root.children.map {
        depth = max(depth, maxDepth($0))
    }
    
    return depth + 1
}

// MARK: -  https://leetcode.com/problems/average-of-levels-in-binary-tree/

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

func averageOfLevels(_ root: TreeNode?) -> [Double] {
    guard let root = root else {
        return []
    }
    
    var nodes = [root]
    var result: [Double] = []
    
    while !nodes.isEmpty {
        var total: Double = 0.0
        var newNodes: [TreeNode?] = []
        var count: Double = 0
        
        for node in nodes {
            count += 1
            total += Double(node.val)
        }
        
        result.append(total / count)
        
        for node in nodes {
            newNodes.append(node.left)
            newNodes.append(node.right)
        }
        
        nodes = newNodes.compactMap { $0 }
    }
    
    return result
}

// MARK: - https://leetcode.com/problems/maximum-depth-of-binary-tree/

func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    var nodes = [root]
    var depth = 1
    
    while !nodes.isEmpty {
        var newNodes: [TreeNode?] = []
        
        for node in nodes {
            if node.left != nil || node.right != nil {
                depth += 1
                break
            }
        }
        
        for node in nodes {
            newNodes.append(node.left)
            newNodes.append(node.right)
        }
        
        nodes = newNodes.compactMap { $0 }
    }
    
    return depth
}
