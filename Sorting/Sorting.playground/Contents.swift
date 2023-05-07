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

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: [Int] = []
        let sortedNums2 = nums2.sorted()

        for i in 0..<nums1.count {
            if sortedNums2.count != 0 {
                if sortedNums2.contains(nums1[i]) {
                    result.append(nums1[i])
                    continue
                }
            }
        }

        return Array(Set(result))
    }
}



// 1387. Sort Integers by The Power Value
// https://leetcode.com/problems/sort-integers-by-the-power-value/

// MARK: - Problem 4

class Solution {
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {

        (lo...hi)
            .map { incomeValue -> (k: Int, v: Int) in
                var key = incomeValue
                var count = 0

                while key != 1 {
                    count += 1
                    if key % 2 == 0 {
                        key = key / 2
                    } else {
                        key = 3 * key + 1
                    }
                }

                return (incomeValue, count)
            }
            .sorted(by: { $0.v < $1.v })[k - 1].k
    }
}


// 969. Pancake Sorting
// https://leetcode.com/problems/pancake-sorting/

// MARK: - Problem 5
