import Foundation

//MARK: - 338. Counting Bits

class Solution1 {
    func countBits(_ n: Int) -> [Int] {
       return Array(0...n).map { index in
            return index.nonzeroBitCount
        }
    }
}

//MARK: - 118. Pascal's Triangle

class Solution2 {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = Array(0..<numRows).map { v -> [Int] in
            var arr = Array(repeating: 0, count: v + 1)
            arr[0] = 1
            arr[v] = 1
            return arr
        }
        
        for i in 0..<numRows {
            if i == 0 || i == 1 { continue }
            for j in 1..<i {
                result[i][j] = result[i - 1][j] + result[i - 1][j - 1]
            }
        }
        
        return result
    }
}

//MARK: - 509. Fibonacci Number

class Solution3 {
    func fib(_ n: Int) -> Int {
        if n <= 1 { return n }
        var result = Array(repeating: 0, count: n + 1)
        result[1] = 1
        for i in 2...n { result[i] = result[i - 1] + result[i - 2] }
        return result[n]
    }
}

//MARK: - 1884. Egg Drop With 2 Eggs and N Floors

class Solution4 {
    func twoEggDrop(_ n: Int) -> Int {
        var n = n, addNum = 1
        while n > 0 {
            n -= addNum
            addNum += 1
        }
        return addNum - 1
    }
}

//MARK: - 1638. Count Substrings That Differ by One Character

class Solution5 {
    func countSubstrings(_ s: String, _ t: String) -> Int {
        return 999
    }
}
