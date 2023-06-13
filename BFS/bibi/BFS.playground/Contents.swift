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
    guard let root = root else { return 0 }
    
    var queue = [Node]()
    queue.append(root)
    var maxDepth = 0
    
    while !queue.isEmpty {
        maxDepth += 1 // 노드를 탐색할 때마다 깊이를 1씩 증가
        var counter = queue.count - 1
        while counter >= 0 {
            let currentNode = queue.removeFirst()
            for child in currentNode.children {
                queue.append(child) // 현재 탐색 중인 노드와 해당 노드의 자식 노드가 Queue에 유지됨
            }
            counter -= 1
        }
    }
    return maxDepth
}

// MARK: - https://leetcode.com/problems/average-of-levels-in-binary-tree/

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
    guard let root = root else { return [] }
    
    var result = [Double]()
    var queue = [TreeNode]()
    queue.append(root)
    
    while !queue.isEmpty {
        let levelSize = queue.count
        var levelSum = 0
        
        for _ in 0..<levelSize {
            let node = queue.removeFirst()
            levelSum += node.val
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        
        let average = Double(levelSum) / Double(levelSize)
        result.append(average)
    }
    
    return result
}

// MARK: - Maximum Depth of binary Tree

func maxDepth(_ root: TreeNode?) -> Int {
    guard let node = root else { return 0 }
    let leftDepth = maxDepth(node.left)
    let rightDepth = maxDepth(node.right)
    return max(leftDepth, rightDepth) + 1
}
