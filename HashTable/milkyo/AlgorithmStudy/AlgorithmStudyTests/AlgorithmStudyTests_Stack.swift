//
//  AlgorithmStudyTests_Stack.swift
//  AlgorithmStudyTests
//
//  Created by Milkyo on 5/1/23.
//

import XCTest

class AlgorithmStudyTests_Stack: XCTestCase {
    var solution: Solution!
    
    override func setUp() {
        self.solution = Solution()
    }
    
    // MARK: - Next Greater Element I
    func test_Next_Greater_Element_I_Example1() {
        let result = solution.nextGreaterElement([4,1,2], [1,3,4,2])
        XCTAssertEqual(result, [-1,3,-1])
    }
    
    // MARK: - Next Greater Element I
    func test_Next_Greater_Element_I_Example2() {
        let result = solution.nextGreaterElement([2,4], [1,2,3,4])
        XCTAssertEqual(result, [3,-1])
    }
    
    // MARK: - Binary Tree Inorder Traversal
    func test_Binary_Tree_Inorder_Traversal_Example1() {
        let rightLeftNode = TreeNode(3)
        let rightNode = TreeNode(2, rightLeftNode, nil)
        let rootNode = TreeNode(1, nil, rightNode)
        let result = solution.inorderTraversal(rootNode)
        XCTAssertEqual(result, [1,3,2])
    }
    // MARK: - Binary Tree Inorder Traversal
    func test_Binary_Tree_Inorder_Traversal_Example2() {
        let result = solution.inorderTraversal(nil)
        XCTAssertEqual(result, [])
    }
    
    // MARK: - Binary Tree Inorder Traversal
    func test_Binary_Tree_Inorder_Traversal_Example3() {
        let result = solution.inorderTraversal(TreeNode(1))
        XCTAssertEqual(result, [1])
    }
    
    // MARK: - Baseball Game
    func test_Baseball_Game_Example1() {
        let result = solution.calPoints(["5","2","C","D","+"])
        XCTAssertEqual(result, 30)
    }
    
    
    // MARK: - Baseball Game
    func test_Baseball_Game_Example2() {
        let result = solution.calPoints(["5","-2","4","C","D","9","+","+"])
        XCTAssertEqual(result, 27)
    }
    
    // MARK: - Baseball Game
    func test_Baseball_Game_Example3() {
        let result = solution.calPoints(["1","C"])
        XCTAssertEqual(result, 0)
    }
    
    // MARK: - Build an Array With Stack Operations
    func test_Build_an_Array_With_Stack_Operations_Example1() {
        let result = solution.buildArray([1,3], 3)
        XCTAssertEqual(result, ["Push","Push","Pop","Push"])
    }
    
    // MARK: - Build an Array With Stack Operations
    func test_Build_an_Array_With_Stack_Operations_Example2() {
        let result = solution.buildArray([1,2,3], 3)
        XCTAssertEqual(result, ["Push","Push","Push"])
    }
    
    // MARK: - Build an Array With Stack Operations
    func test_Build_an_Array_With_Stack_Operations_Example3() {
        let result = solution.buildArray([1,2], 4)
        XCTAssertEqual(result, ["Push","Push"])
    }
}
