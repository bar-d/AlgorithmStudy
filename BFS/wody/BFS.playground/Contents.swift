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

//let node3Depth5 = Node(5)
//let node3Depth6 = Node(6)
//let node2Depth3 = Node(3, children: [node3Depth5, node3Depth6])
//let node2Depth2 = Node(2)
//let node2Depth4 = Node(4)
//let node1Depth1 = Node(1, children: [node2Depth3, node2Depth2, node2Depth4])
//
//print(maxDepth(node1Depth1))

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

/*
 https://leetcode.com/problems/average-of-levels-in-binary-tree/
 637. Average of Levels in Binary Tree

 이진 트리의 수준 평균

 각 Depth별 평균을 구해서 배열로 반환하세요

 이진트리를 다항 트리로 바꿔서 평균을 구해볼까?

 */

func averageOfLevels(_ root: TreeNode?) -> [Double] {
    guard let root = root else { return [] }

    var values: [Int: Int] = [:]
    var counts: [Int: Int] = [:]
    var maxLevel = 0
    var averageValue: [Double] = []

    func search(node: TreeNode, currentLevel: Int = 0) {
        values[currentLevel, default: 0] += node.val
        counts[currentLevel, default: 0] += 1

        if maxLevel < currentLevel {
            maxLevel = currentLevel
        }

        if let left = node.left {
            search(node: left, currentLevel: currentLevel + 1)
        }

        if let right = node.right {
            search(node: right, currentLevel: currentLevel + 1)
        }
    }

    search(node: root)

    for level in 0...maxLevel {
        guard let value = values[level],
              let count = counts[level]
        else { continue }

        averageValue.append(Double(value) / Double(count))
    }

    return averageValue
}

var level2RightRightNode = TreeNode(7)
var level2RightLeftNode = TreeNode(15)
var level1RightNode = TreeNode(20, level2RightLeftNode, level2RightRightNode)
var level1LeftNode = TreeNode(9)
let rootNode = TreeNode(3, level1LeftNode, level1RightNode)

print(averageOfLevels(rootNode))

/*
 https://leetcode.com/problems/maximum-depth-of-binary-tree/
 104. Maximum Depth of Binary Tree
 이진트리의 최대 깊이
 */

func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var maxDepth = 1

    func search(node: TreeNode, currentDepth: Int = 1) {
        if maxDepth < currentDepth {
            maxDepth = currentDepth
        }

        if let left = node.left {
            search(node: left, currentDepth: currentDepth + 1)
        }

        if let right = node.right {
            search(node: right, currentDepth: currentDepth + 1)
        }
    }

    search(node: root)

    return maxDepth
}

/*
 https://leetcode.com/problems/n-ary-tree-level-order-traversal/
 429. N-ary Tree Level Order Traversal
 N항 트리 수준 순회
 다항 트리가 주어지면 해당 노드 값의 레벨별 순회를 반환합니다.
 */

func levelOrder(_ root: Node?) -> [[Int]] {
    guard let root = root else { return [] }

    var valDict: [Int: [Int]] = [:]

    func search(root: Node, currentDepth: Int = 1) {

        valDict[currentDepth, default: []].append(root.val)

        root.children
            .map { children in
                search(root: children, currentDepth: currentDepth + 1)
            }
    }

    search(root: root)

    return valDict
        .sorted { $0.key < $1.key }
        .map { $0.value }
}

/*
 https://leetcode.com/problems/lowest-common-ancestor-of-deepest-leaves/
 1123. Lowest Common Ancestor of Deepest Leaves

 문제 조건
 이진 트리의 노드는 자식이 없는 경우에만 '잎'이라고 말할 수 있습니다.
 이진 트리의 잎 중 가장 깊이(depth) 있는 잎의 가장 낮은 공통 조상을 반환합니다.


 이해하기 어려우니 그려가며 풀어봅시다.

     A
    / \
   B   C
  / \
 D   E

 위 조건에서 현재 가장 깊이 있는 잎은 'D'와 'E' 입니다.
 둘의 공통 조상은 B입니다.

      A
     / \
    B   C
   / \
  D   E
       \
        F

 만약 다음과 같은 이진 트리가 주어질 경우 가장 깊은 잎은 F이며 하나이기 때문에 가장 낮은 공통 조상은 자기 자신이 됩니다.
 따라서 답은 F입니다.

        A
       / \
      B   C
     / \
    D   E
   /     \
  F       G

만약 다음과 같은 이진 트리가 주어질 경우 가장 깊은 잎은 F, G이며 공통 조상은 B입니다.
 */

func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {

    func search(_ node: TreeNode?) -> (node: TreeNode?, currentLevel: Int) {
        guard let node = node else { return (node: nil, currentLevel: -1 ) }
        
        let left: (node: TreeNode?, currentLevel: Int) = search(node.left)
        let right: (node: TreeNode?, currentLevel: Int) = search(node.right)

        if left.currentLevel == right.currentLevel {
            return (node: node, left.currentLevel + 1)
        } else if right.currentLevel < left.currentLevel {
            return (node: left.node, left.currentLevel + 1)
        } else {
            return (node: right.node, right.currentLevel + 1)
        }
    }

    return search(root).node
}
