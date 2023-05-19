// MARK: - https://leetcode.com/problems/counting-bits/description/

func countBits(_ n: Int) -> [Int] {
    var result: [Int] = []
    
    for i in 0...n {
        let oneCount = String(i, radix: 2)
            .map { String($0) }
            .filter { $0 == "1" }
            .count
        
        result.append(oneCount)
    }
    
    return result
}

// MARK: - https://leetcode.com/problems/pascals-triangle/

func generate(_ numRows: Int) -> [[Int]] {
    var pascalArray: [[Int]] = [[1]]
    
    for row in 0..<numRows - 1 {
        if row == 0 {
            pascalArray.append([1, 1])
        } else {
            let previousArray = pascalArray[row]
            var currentArray: [Int] = [1]
            
            for i in 0...row - 1 {
                currentArray.append(previousArray[i] + previousArray[i + 1])
            }
            
            currentArray.append(1)
            pascalArray.append(currentArray)
        }
    }
    
    return pascalArray
}

// MARK: - https://leetcode.com/problems/fibonacci-number/solutions/3018743/one-line-solution-on-swift/

func fib(_ n: Int) -> Int {
    if n < 2 {
        return n
    }
    
    return fib(n - 1) + fib(n - 2)
}
