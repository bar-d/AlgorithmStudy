// MARK: - Problem 1
// 2078. Two Furthest Houses With Different Colors
// https://leetcode.com/problems/two-furthest-houses-with-different-colors/
class Solution {
    func maxDistance(_ colors: [Int]) -> Int {
        var max_distance = 0
        var distance = 0
        guard let first = colors.first, let last = colors.last else {
            return 0
        }
        
        if first != last {
            return colors.count - 1
        }
        else
        {
            for i in 0..<colors.count {
                if colors[i] != colors[colors.count - 1] {
                    max_distance = max(max_distance, colors.count - 1 - i)
                    break
                }
            }

            for i in 0..<colors.count {
                if colors[colors.count - 1 - i] != colors[0] {
                    max_distance = max(max_distance, colors.count - 1 - i)
                    break
                }
            }
        }
        return max_distance
    }
}

// MARK: - Problem 2
// 2224. Minimum Number of Operations to Convert Time
// https://leetcode.com/problems/minimum-number-of-operations-to-convert-time/


// MARK: - Problem 3
// 2600. K Items With the Maximum Sum
// https://leetcode.com/problems/k-items-with-the-maximum-sum/
class Solution {
    func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
        guard k == 0 else {
            for i in 1...k {
                if numOnes >= k
                {
                    return k
                }
                else if numZeros >= (k - numOnes)
                {
                    return numOnes + ((k - numOnes) * 0)
                }
                else
                {
                    return numOnes + ((k - numOnes - numZeros) * -1)
                }
            }
            return 1
        }

        return 0
    }
}


// MARK: - Problem 4
// 1963. Minimum Number of Swaps to Make the String Balanced
// https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced/


// MARK: - Problem 5
// 1338. Reduce Array Size to The Half
// https://leetcode.com/problems/reduce-array-size-to-the-half/

