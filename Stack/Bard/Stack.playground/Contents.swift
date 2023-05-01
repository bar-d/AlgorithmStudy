// MARK: - https://leetcode.com/problems/next-greater-element-i/description/

func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var array: [Int] = Array(repeating: -1, count: nums1.count)
    
    for i in 0..<nums1.count {
        for l in 0..<nums2.count {
            if nums1[i] == nums2[l] {
                for index in l..<nums2.count {
                    if nums2[index] > nums1[i] {
                        array[i] = nums2[index]
                        break
                    }
                }
            }
        }
    }
    
    return array
}

// MARK: - https://leetcode.com/problems/binary-tree-inorder-traversal/

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

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var currentNode = root
    var treeNodeArray: [TreeNode] = []
    var result = [Int]()
    
    while !treeNodeArray.isEmpty || currentNode != nil {
        while currentNode != nil {
            treeNodeArray.append(currentNode!)
            currentNode = currentNode?.left
        }
        
        currentNode = treeNodeArray.popLast()
        result.append(currentNode!.val)
        currentNode = currentNode?.right
    }
    
    return result
}
