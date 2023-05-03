//MARK: - 2578. Split With Minimum Sum

class Solution1 {
    func splitNum(_ num: Int) -> Int {
        var sortedNum = Array(String(num)).sorted()
        var num1 = "", num2 = ""
        
        for i in 0..<sortedNum.count {
            if i % 2 == 0 {
                num1 += String(sortedNum[i])
            } else {
                num2 += String(sortedNum[i])
            }
        }
        
        return Int(num1)! + Int(num2)!
    }
}
