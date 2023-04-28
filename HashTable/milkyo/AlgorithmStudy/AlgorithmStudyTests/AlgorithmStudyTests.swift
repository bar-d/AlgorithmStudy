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
    
    // MARK: - Sort Characters By Frequency
    func test_Sort_Characters_By_Frequency_Example1() {
        let result = solution.frequencySort("tree")
        XCTAssertEqual(result, "eert")
    }
    
    func test_Sort_Characters_By_Frequency_Example2() {
        let result = solution.frequencySort("cccaaa")
        XCTAssertEqual(result, "aaaccc")
    }
    
    func test_Sort_Characters_By_Frequency_Example3() {
        let result = solution.frequencySort("Aabb")
        XCTAssertEqual(result, "bbAa")
    }
    
    // MARK: - Equal Row and Column Pairs
    func test_Equal_Row_and_Column_Pairs_Example1() {
        let result = solution.equalPairs([[3,2,1],[1,7,6],[2,7,7]])
        XCTAssertEqual(result, 1)
    }
    
    func test_Equal_Row_and_Column_Pairs_Example2() {
        let result = solution.equalPairs([[3,1,2,2],[1,4,4,5],[2,4,2,2],[2,4,2,2]])
        XCTAssertEqual(result, 3)
    }
    
    // MARK: - Count Pairs Of Similar Strings
    func test_Count_Pairs_Of_Similar_Strings_Example1() {
        let result = solution.similarPairs(["aba","aabb","abcd","bac","aabc"])
        XCTAssertEqual(result, 2)
    }
    
    func test_Count_Pairs_Of_Similar_Strings_Example2() {
        let result = solution.similarPairs(["aabb","ab","ba"])
        XCTAssertEqual(result, 3)
    }
    
    func test_Count_Pairs_Of_Similar_Strings_Example3() {
        let result = solution.similarPairs(["nba","cba","dba"])
        XCTAssertEqual(result, 0)
    }
}
