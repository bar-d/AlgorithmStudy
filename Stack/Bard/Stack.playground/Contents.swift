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

// MARK: - https://leetcode.com/problems/baseball-game/

func calPoints(_ operations: [String]) -> Int {
    var operandArray: [Int] = []
    
    for operation in operations {
        if Int(operation) == nil {
            if operation == "+" {
                let lastOperand = operandArray.last!
                let firstOperand = operandArray[operandArray.count - 2]
                let newOperand = firstOperand + lastOperand
                operandArray.append(newOperand)
            } else if operation == "D" {
                let lastOperand = operandArray.last!
                let newOperand = lastOperand * 2
                operandArray.append(newOperand)
            } else if operation == "C" {
                operandArray.removeLast()
            }
        } else {
            operandArray.append(Int(operation)!)
        }
    }
    
    return operandArray.reduce(0, +)
}

// MARK: - https://leetcode.com/problems/build-an-array-with-stack-operations/

func buildArray(_ target: [Int], _ n: Int) -> [String] {
    var s: [Int] = []
    var numberArray: [Int] = []
    var commandArray: [String] = []
    
    for i in 1...n {
        numberArray.append(i)
    }
    
    for number in numberArray {
        s.append(number)
        commandArray.append("Push")
        
        if !target.contains(number) {
            s.removeLast()
            commandArray.append("Pop")
        }
        
        if s == target {
            break
        }
    }
    
    return commandArray
}
