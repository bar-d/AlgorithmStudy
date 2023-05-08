// MARK: - https://leetcode.com/problems/split-with-minimum-sum/


func splitNum(_ num: Int) -> Int {
    var sortedNum = String(num).map { String($0) }.sorted(by: >)
    var firstNum = ""
    var secondNum = ""
    var result = 0
    
    while !sortedNum.isEmpty {
        firstNum += sortedNum.popLast() ?? "0"
        
        if sortedNum.isEmpty {
            break
        }
        
        secondNum += sortedNum.popLast() ?? "0"
    }
    
    result = (Int(firstNum) ?? 0) + (Int(secondNum) ?? 0)
    
    return result
}

// MARK: - https://leetcode.com/problems/sort-array-by-parity-ii/

func sortArrayByParityII(_ nums: [Int]) -> [Int] {
    var evenNums: [Int] = []
    var oddNums: [Int] = []
    var result: [Int] = []
    
    for num in nums {
        if num % 2 == 0 {
            evenNums.append(num)
        } else {
            oddNums.append(num)
        }
    }
    
    for i in 0..<evenNums.count {
        result.append(evenNums[i])
        result.append(oddNums[i])
    }
    
    return result
}

// MARK: - https://leetcode.com/problems/intersection-of-two-arrays/

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var nums1Set = Set(nums1)
    var nums2Set = Set(nums2)
    
    return Array(nums1Set.intersection(nums2Set))
}
