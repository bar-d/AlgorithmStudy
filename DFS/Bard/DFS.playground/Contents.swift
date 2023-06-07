// MARK: - https://leetcode.com/problems/univalued-binary-tree/description/

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

class Solution {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return checkValue(of: root, root.val)
    }
    
    func checkValue(of node: TreeNode?, _ value: Int) -> Bool {
        guard let node = node else {
            return true
        }
        
        if node.val != value {
            return false
        }
        
        return checkValue(of: node.left, value) && checkValue(of: node.right, value)
    }
}

// MARK: - https://leetcode.com/problems/island-perimeter/description/

func islandPerimeter(_ grid: [[Int]]) -> Int {
    var count = 0
    
    for row in 0..<grid.count {
        for column in 0..<grid[row].count {
            let currentCell = grid[row][column]
            
            if currentCell == 1 {
                if row == 0 || row == grid.count - 1 {
                    count += 1
                }
                
                if column == 0 || column == grid[row].count - 1 {
                    count += 1
                }
                
                if column - 1 >= 0 && grid[row][column - 1] == 0 {
                    count += 1
                }
                
                if column < grid[row].count - 1 && grid[row][column + 1] == 0 {
                    count += 1
                }
                
                if row - 1 >= 0 && grid[row - 1][column] == 0 {
                    count += 1
                }
                
                if row < grid.count - 1 && grid[row + 1][column] == 0 {
                    count += 1
                }
            }
        }
    }
    
    return count
}

// MARK: - https://leetcode.com/problems/binary-tree-postorder-traversal/

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    return postorderTraversal(root.left) + postorderTraversal(root.right) + [root.val]
}

// MARK: - https://leetcode.com/problems/kth-smallest-element-in-a-bst/

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    guard let root = root else {
        return 0
    }
    
    var graph: [[Int]] = [[root.val]]
    var stack: [TreeNode?] = [root]
    
    while !stack.isEmpty {
        if let currentNode = stack.popLast() {
            if currentNode != nil {
                if currentNode?.left != nil && currentNode?.right != nil {
                    stack.append(currentNode?.left!)
                    stack.append(currentNode?.right!)
                    graph.append([currentNode!.left!.val, currentNode!.right!.val])
                } else if currentNode?.left != nil {
                    stack.append(currentNode?.left!)
                    graph.append([currentNode!.left!.val])
                } else if currentNode?.right != nil {
                    stack.append(currentNode?.right!)
                    graph.append([currentNode!.right!.val])
                }
            }
        }
        else {
            graph.append([])
        }
    }
    
    return graph.flatMap { $0 }.sorted(by: { $0 < $1 })[k - 1]
}

// MARK: - https://leetcode.com/problems/delete-nodes-and-return-forest/

func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
    
    func del(_ node: TreeNode? = root, _ parent: TreeNode? = nil, _ left: Bool = false) -> [TreeNode?] {
        
        guard let node = node else { return [] }
        
        var res = [TreeNode?]()
        if parent == nil, !to_delete.contains(node.val) { res.append(node) }
        
        if to_delete.contains(node.val) {
            if left {parent?.left = nil }
            else { parent?.right = nil }
            
            if let l = node.left, !to_delete.contains(l.val) { res.append(l) }
            if let r = node.right, !to_delete.contains(r.val) { res.append(r) }
        }
        
        return res + del(node.left, node, true) + del(node.right, node, false)
    }
    
    return del(root)
}
