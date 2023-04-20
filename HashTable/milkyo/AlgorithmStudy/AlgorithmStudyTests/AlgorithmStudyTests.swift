//
//  AlgorithmStudyTests.swift
//  AlgorithmStudyTests
//
//  Created by Milkyo on 4/20/23.
//
import XCTest

final class AlgorithmStudyTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        self.solution = Solution()
    }

    func test_Count_Common_Words_With_One_Occurrence_Example1() {
        let result = solution.countWords(["leetcode","is","amazing","as","is"], ["amazing","leetcode","is"])
        XCTAssertEqual(result, 2)
    }
    
    func test_Count_Common_Words_With_One_Occurrence_Example2() {
        let result = solution.countWords(["b","bb","bbb"], ["a","aa","aaa"])
        XCTAssertEqual(result, 0)
    }

    func test_Count_Common_Words_With_One_Occurrence_Example3() {
        let result = solution.countWords(["a","ab"], ["a","a","a","ab"])
        XCTAssertEqual(result, 1)
    }
}
