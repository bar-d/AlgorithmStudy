// MARK: - https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/

func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
    var dictionary: [Int:[Int]] = [:]
    var result: [Int] = []
    
    for (index, element) in mat.enumerated() {
        dictionary[index] = element
    }
    
    let sortedArray = dictionary
        .sorted(by:{ first, second in
            let firstValue = first.value.filter { $0 == 1 }.count
            let secondValue = second.value.filter { $0 == 1 }.count
            
            if firstValue == secondValue {
                return first.key < second.key
            }
            
            return firstValue < secondValue
        })
        .map { $0.key }
    
    result = sortedArray[0..<k].map { $0 }
    
    return result
}

// MARK: - https://leetcode.com/problems/longest-subsequence-with-limited-sum/description/

func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
    let sortedNums = nums.sorted(by: <)
    var result: [Int] = []
    
    for sum in queries {
        var totalNum = 0
        var count = 0
        
        for currentNum in sortedNums {
            totalNum += currentNum
            
            if totalNum <= sum {
                count += 1
            } else {
                break
            }
        }
        
        result.append(count)
    }
    
    return result
}
