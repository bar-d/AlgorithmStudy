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
