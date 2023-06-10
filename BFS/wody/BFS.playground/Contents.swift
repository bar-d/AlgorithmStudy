import UIKit

/*
 https://leetcode.com/problems/maximum-depth-of-n-ary-tree/
 559. Maximum Depth of N-ary Tree

 다항 트리의 최대 깊이

 트리의 최대 depth를 반환하면 됩니다.
*/

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }

    public init(_ val: Int, children: [Node] = []) {
        self.val = val
        self.children = children
    }
}

func maxDepth(_ root: Node?) -> Int {
    guard let root = root else { return 0 }

    func search(root: Node?, currentDepth: Int = 1) -> Int {
        guard let root = root else { return currentDepth }

        return root.children
            .map { children in
                search(root: children, currentDepth: currentDepth + 1)
            }
            .max() ?? currentDepth
    }

    return search(root: root)
}

let node3Depth5 = Node(5)
let node3Depth6 = Node(6)
let node2Depth3 = Node(3, children: [node3Depth5, node3Depth6])
let node2Depth2 = Node(2)
let node2Depth4 = Node(4)
let node1Depth1 = Node(1, children: [node2Depth3, node2Depth2, node2Depth4])

print(maxDepth(node1Depth1))

