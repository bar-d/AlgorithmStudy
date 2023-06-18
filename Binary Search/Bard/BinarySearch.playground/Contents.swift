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

// MARK: - https://leetcode.com/problems/find-positive-integer-solution-for-a-given-equation

class CustomFunction {
    func f(_ x: Int, _ y: Int) -> Int {
        var result = 0
        // do something
        return result
    }
}

func findSolution(_ customfunction: CustomFunction, _ z: Int) -> [[Int]] {
    var result: [[Int]] = []
    var x = 1
    var y = 1000
    
    while x <= 1000 && y >= 1 {
        let value = customfunction.f(x, y)
        if value == z {
            result.append([x, y])
            x += 1
            y -= 1
        } else if value < z {
            x += 1
        } else {
            y -= 1
        }
    }
    
    return result
}

// MARK: - https://leetcode.com/problems/peak-index-in-a-mountain-array

func peakIndexInMountainArray(_ arr: [Int]) -> Int {
    var currentLevel = 0
    
    for (level, element) in arr.enumerated() {
        if level > 0 {
            let currentElement = element
            let previousElement = arr[currentLevel]
            
            if currentElement > previousElement {
                currentLevel = level
            } else {
                break
            }
        }
    }
    
    return currentLevel
}
