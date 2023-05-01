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
}
