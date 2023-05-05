// 2578. Split With Minimum Sum
// https://leetcode.com/problems/split-with-minimum-sum/

// MARK: - Problem 1


// 922. Sort Array By Parity II
// https://leetcode.com/problems/sort-array-by-parity-ii/description/

// MARK: - Problem 2

class Solution {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted()
        var oddNums: [Int] = []
        var evenNums: [Int] = []
        var result: [Int] = []

        for i in 0..<sortedNums.count {
            if sortedNums[i] % 2 == 0 {
                evenNums.append(sortedNums[i])
            } else {
                oddNums.append(sortedNums[i])
            }
        }

        for i in 0..<sortedNums.count {
            if i % 2 == 0 {
                if let firstEven = evenNums.first {
                    result.append(firstEven)
                    evenNums.removeFirst()
                }
            } else {
                if let firstOdd = oddNums.first {
                    result.append(firstOdd)
                    oddNums.removeFirst()
                }
            }
        }

        return result
    }
}

// 349. Intersection of Two Arrays
// https://leetcode.com/problems/intersection-of-two-arrays/

// MARK: - Problem 3



// 1387. Sort Integers by The Power Value
// https://leetcode.com/problems/sort-integers-by-the-power-value/

// MARK: - Problem 4


// 969. Pancake Sorting
// https://leetcode.com/problems/pancake-sorting/

// MARK: - Problem 5
