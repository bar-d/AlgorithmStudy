//
//  BaseTestCase.swift
//  AlgorithmStudyTests
//
//  Created by Milkyo on 5/15/23.
//

import XCTest

class BaseTestCase: XCTestCase {
    var solution: Solution!
    
    override func setUp() {
        self.solution = Solution()
    }
}
