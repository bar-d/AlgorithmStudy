// MARK: - https://leetcode.com/problems/two-furthest-houses-with-different-colors/

func maxDistance(_ colors: [Int]) -> Int {
    var currentIndex = 0
    var firstResult = colors.count - 1
    var secondResult = colors.count - 1
    
    while colors[0] == colors[firstResult] {
        firstResult -= 1
    }
    
    while colors[currentIndex] == colors[secondResult] {
        currentIndex += 1
    }
    
    return max(firstResult - 0, secondResult - currentIndex)
}

// MARK: - https://leetcode.com/problems/minimum-number-of-operations-to-convert-time/

func convertTime(_ current: String, _ correct: String) -> Int {
    var count = 0
    var currentHour = Int(current.split(separator: ":").first!)!
    var currentMinute = Int(current.split(separator: ":").last!)!
    let correctHour = Int(correct.split(separator: ":").first!)!
    let correctMinute = Int(correct.split(separator: ":").last!)!
    
    while currentMinute != correctMinute {
        if (correctMinute - currentMinute) % 15 == 0 {
            currentMinute += 15
            count += 1
        } else if (correctMinute - currentMinute) % 5 == 0 {
            currentMinute += 5
            count += 1
        } else {
            currentMinute += 1
            count += 1
        }
        
        if currentMinute >= 60 {
            currentMinute -= 60
            currentHour += 1
        }
    }
    
    while currentHour != correctHour {
        currentHour += 1
        count += 1
        
        if currentHour == 24 {
            currentHour = 0
        }
    }
    
    return count
}

// MARK: - https://leetcode.com/problems/k-items-with-the-maximum-sum/

func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
    var numArray: [Int] = []
    var result = 0
    
    for _ in 0..<numOnes {
        numArray.append(1)
    }
    
    for _ in 0..<numZeros {
        numArray.append(0)
    }
    
    for _ in 0..<numNegOnes {
        numArray.append(-1)
    }
    
    for i in 0..<k {
        result += numArray[i]
    }
    
    return result
}

// MARK: - https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced/

func minSwaps(_ s: String) -> Int {
    let arr = Array(s)
    var result = 0
    var count = 0
    
    for ch in arr {
        if ch == "]" {
            count += 1
        } else {
            count -= 1
        }
        result = max(result, count)
    }
    
    return (result + 1) / 2
}
