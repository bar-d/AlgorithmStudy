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
