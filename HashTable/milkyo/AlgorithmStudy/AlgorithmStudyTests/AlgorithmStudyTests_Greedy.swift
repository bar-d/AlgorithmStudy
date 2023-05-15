//
//  AlgorithmStudyTests_Greedy.swift
//  AlgorithmStudyTests
//
//  Created by Milkyo on 5/15/23.
//

import XCTest

class AlgorithmStudyTests_Greedy: BaseTestCase {
    
    func test_Two_Furthest_Houses_With_Different_Colors_Example1() {
        let result = solution.maxDistance([1,1,1,6,1,1,1])
        XCTAssertEqual(result, 3)
    }
    
    func test_Two_Furthest_Houses_With_Different_Colors_Example2() {
        let result = solution.maxDistance([1,8,3,8,3])
        XCTAssertEqual(result, 4)
    }
    
    func test_Two_Furthest_Houses_With_Different_Colors_Example3() {
        let result = solution.maxDistance([0,1])
        XCTAssertEqual(result, 1)
    }
    
    func test_Minimum_Number_Of_Operations_To_Convert_Time_Example1() {
        let result = solution.convertTime("02:30", "04:35")
        XCTAssertEqual(result, 3)
    }
    
    func test_Minimum_Number_Of_Operations_To_Convert_Time_Example2() {
        let result = solution.convertTime("11:00", "11:01")
        XCTAssertEqual(result, 1)
    }
    
    func test_K_Items_With_the_Maximum_Sum_Example1() {
        let result = solution.kItemsWithMaximumSum(3, 2, 0, 2)
        XCTAssertEqual(result, 2)
    }
    
    func test_K_Items_With_the_Maximum_Sum_Example2() {
        let result = solution.kItemsWithMaximumSum(3, 2, 0, 4)
        XCTAssertEqual(result, 3)
    }
    
    func test_K_Items_With_the_Maximum_Sum_Example3() {
        let result = solution.kItemsWithMaximumSum(6, 6, 6, 13)
        XCTAssertEqual(result, 5)
    }
    
    func test_Reduce_Array_Size_to_The_Half_Example1() {
        let result = solution.minSetSize([3,3,3,3,5,5,5,2,2,7])
        XCTAssertEqual(result, 2)
    }
    
    func test_Reduce_Array_Size_to_The_Half_Example2() {
        let result = solution.minSetSize([7,7,7,7,7,7])
        XCTAssertEqual(result, 1)
    }
}
