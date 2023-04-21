//
//  AlgorithmStudyTests.swift
//  AlgorithmStudyTests
//
//  Created by Milkyo on 4/20/23.
//
import XCTest

final class AlgorithmStudyTests_HashTable: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        self.solution = Solution()
    }

    // MARK: - Count Common Words With One Occurrence
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
    
    // MARK: - Check Distances Between Same Letters
    func test_Check_Distances_Between_Same_Letters_Example1() {
        let result = solution.checkDistances("abaccb",  [1,3,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        XCTAssertEqual(result, true)
    }
    
    func test_Check_Distances_Between_Same_Letters_Example2() {
        let result = solution.checkDistances("aa", [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        XCTAssertEqual(result, false)
    }
}
