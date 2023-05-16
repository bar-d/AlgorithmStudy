//MARK: - 2078. Two Furthest Houses With Different Colors

class Solution1 {
    func maxDistance(_ colors: [Int]) -> Int {
        var result = Int()
        let count = colors.count / 2 + colors.count % 2
        
        for i in 0..<count {
            for j in stride(from: colors.count - 1, through: count, by: -1) {
                if colors[i] != colors[j] {
                    result = max(result, j-i)
                    break
                }
            }
        }
        return result
    }
}

//MARK: - 2224. Minimum Number of Operations to Convert Time

class Solution2 {
    func convertTime(_ current: String, _ correct: String) -> Int {
        let current = (Int(current.prefix(2))! * 60) + Int(current.suffix(2))!
        let correct = (Int(correct.prefix(2))! * 60) + Int(correct.suffix(2))!
        var interval = correct - current

        var result = 0
        let operationTime = [60,15,5,1]
        
        for i in operationTime {
            result += interval / i
            interval = interval % i
            if interval == 0 { break }
        }

        return result
    }
}

//MARK: - 2600. K Items With the Maximum Sum

class Solution3_1 {
    func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
        return min(k, numOnes) - max(0, k - numOnes - numZeros)
    }
}

class Solution3_2 {
    func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
        if numOnes >= k {
            return k
        } else if numOnes + numZeros >= k {
            return numOnes
        } else {
            return numOnes - (k - numOnes - numZeros)
        }
    }
}
