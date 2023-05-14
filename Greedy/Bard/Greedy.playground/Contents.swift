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
