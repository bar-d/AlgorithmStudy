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

// MARK: - https://leetcode.com/problems/egg-drop-with-2-eggs-and-n-floors/description/

/**
 두개의 계란이 주어짐
 1에서 n까지 n층에 접근할 수 있음
 0  <= f <= n인 f층이 존재
 f보다 높은 층에 떨어진 계란은 깨짐
 f보다 낮은 층에 떨어진 계란을 안떨어짐
 이동할 때마다 깨지지 않은 계란을 가져다가 임의 x층에서 떨어뜨릴 수 있음 ( 1 <= x <= n).
 계란이 깨지면 더 이상 사용할 수 없음
 알이 깨지지 않으면 다음에 또 떨어뜨릴 수 있음
 f의 값이 무엇인지 확실하게 결정하는 데 필요한 최소 이동 수를 반환
 */

func twoEggDrop(_ n: Int) -> Int {
    // Create a 2D array to store the minimum number of moves
    let eggs = 2
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: 3)
    
    // Base cases
    for i in 1...n {
        dp[1][i] = i // Only one egg available
    }
    
    // Fill the dp array for 2 eggs and different floor combinations
    for floors in 1...n {
        dp[eggs][floors] = Int.max
        for floor in 1...floors {
            let dropsIfBreaks = dp[eggs - 1][floor - 1] // Egg breaks, check lower floors
            let dropsIfSurvives = dp[eggs][floors - floor] // Egg survives, check upper floors
            let drops = max(dropsIfBreaks, dropsIfSurvives) + 1 // Maximum drops between the two scenarios
            
            dp[eggs][floors] = min(dp[eggs][floors], drops) // Take the minimum number of moves
        }
    }
    
    
    return dp[2][n] // Return the minimum number of moves
}

// MARK: - https://leetcode.com/problems/count-substrings-that-differ-by-one-character/

/**
 두 개의 문자열 s와 t가 주어지면 비어 있지 않은 s의 하위 문자열을 선택하고 결과 하위 문자열이 t의 하위 문자열이 되도록 단일 문자를 다른 문자로 대체할 수 있는 방법의 수를 찾으십시오. 즉, t의 일부 하위 문자열과 정확히 한 문자 차이가 나는 s의 하위 문자열 수를 찾습니다.
 
 예를 들어, "computer"와 "computation"의 밑줄 친 하위 문자열은 'e'/'a'만 다르므로 이것이 유효한 방법입니다.
 
 위의 조건을 만족하는 하위 문자열의 수를 반환합니다.
 
 하위 문자열은 문자열 내의 연속적인 문자 시퀀스입니다.
 */

func countSubstrings(_ s: String, _ t: String) -> Int {
    let s = Array(s)
    let t = Array(t)
    var same_dp = [[Int]](repeating: [Int](repeating: 0, count: t.count + 1), count: s.count + 1)
    var diff_dp = [[Int]](repeating: [Int](repeating: 0, count: t.count + 1), count: s.count + 1)
    var result = 0
    
    for i in 1...s.count {
        for j in 1...t.count {
            if s[i - 1] == t[j - 1] {
                same_dp[i][j] = same_dp[i - 1][j - 1] + 1
                diff_dp[i][j] = diff_dp[i - 1][j - 1]
            }
            else {
                same_dp[i][j] = 0
                diff_dp[i][j] = ((i == 1 && j == 1) ? 0 : same_dp[i - 1][j - 1]) + 1
            }
            result += diff_dp[i][j]
        }
    }
    
    return result
}
