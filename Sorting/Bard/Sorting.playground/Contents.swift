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

// MARK: - https://leetcode.com/problems/sort-integers-by-the-power-value/

func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
    var dictionary: [Int: Int] = [:]
    
    for i in lo...hi {
        var count = 0
        var key = i
        
        while key != 1 {
            key = transform(key)
            count += 1
        }
        
        dictionary[i] = count
    }
    
    let sortedArray = dictionary
        .sorted {
            if $0.value == $1.value {
                return $0.key < $1.key
            } else {
                return $0.value < $1.value
            }
        }
        .map { $0.key }
    
    return sortedArray[k - 1]
}

func transform(_ int: Int) -> Int {
    var answer = int
    
    if answer % 2 == 0 {
        answer = answer / 2
    } else {
        answer = 3 * answer + 1
    }
    
    return answer
}
