import UIKit

/*
 https://leetcode.com/problems/univalued-binary-tree/
 965 . 값이 없는 이진 트리

 노드를 탐색하며 모든 값이 동일한 값인지 체크해야 함

 1. 노드 탐색 (왼쪽부터)
 2. 탐색 중 값을 스택에 모두 저장(nil은 push 안함)
 3. 스택에 값이 다른게 있다면 false
 */

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

func isUnivalTree(_ root: TreeNode?) -> Bool {

    var values = [Int]()

    func checkNode(_ node: TreeNode?) -> TreeNode? {
        guard let value = node?.val else { return nil }
        values.append(value)

        // 왼쪽 노드가 있다
        if let leftNode = node?.left {
            checkNode(leftNode)
        }

        // 오른쪽 노드가 있다
        if let rightNode = node?.right {
            checkNode(rightNode)
        }

        // 노드의 끝
        return nil
    }

    checkNode(root)

    return Set(values).count == 1
}

let rightNode2 = TreeNode(9, nil, nil)
let rightNode1 = TreeNode(1, nil, rightNode2)
let leftNode2 = TreeNode(1, nil, nil)
let leftNode1 = TreeNode(1, leftNode2, leftNode2)
let testNode = TreeNode(1, leftNode1, rightNode1)

print(isUnivalTree(testNode))


/*
 https://leetcode.com/problems/island-perimeter/
 463. Island Perimeter
 섬 주변
 */

extension Int {
    var isZero: Bool {
        return self == 0
    }
}

func islandPerimeter(_ grid: [[Int]]) -> Int {
    var result = 0

    for rowIndex in 0..<grid.count {
        for colIndex in 0..<grid[rowIndex].count {
            let cell = grid[rowIndex][colIndex]
            // 육지면
            if !cell.isZero {

                // 북 체크
                if 0 <= (rowIndex - 1) {
                    let northCell = grid[rowIndex-1][colIndex]
                    if northCell.isZero {
                        result += 1
                    }
                } else {
                    result += 1
                }

                // 서 체크
                if 0 <= (colIndex - 1) {
                    let westCell = grid[rowIndex][colIndex - 1]
                    if westCell.isZero {
                        result += 1
                    }
                } else {
                    result += 1
                }

                // 남 체크
                if (rowIndex + 1) <= (grid.count - 1) {
                    let southCell = grid[rowIndex + 1][colIndex]
                    if southCell.isZero {
                        result += 1
                    }
                } else {
                    result += 1
                }

                // 동 체크
                if (colIndex + 1) <= (grid[rowIndex].count - 1) {
                    let eastCell = grid[rowIndex][colIndex + 1]
                    if eastCell.isZero {
                        result += 1
                    }
                } else {
                    result += 1
                }
            }
        }
    }

    return result
}

print("### island : \(islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]))")
