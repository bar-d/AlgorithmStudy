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
