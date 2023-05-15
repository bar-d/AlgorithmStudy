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
