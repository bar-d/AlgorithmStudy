import Foundation

// MARK: - 2578. Split With Minimum Sum

class Solution1 {
    func splitNum(_ num: Int) -> Int {
        
        let sortedNumbers = String(num).sorted()
        var firstStringNumber = "", secondStringNumber = ""
        
        for (index, characterNumber) in sortedNumbers.enumerated() {
            let stringNumber = String(characterNumber)
            if index % 2 == 0 {
                firstStringNumber += stringNumber
            } else {
                secondStringNumber += stringNumber
            }
        }
        
        let firstNumber = Int(firstStringNumber) ?? 0
        let secondNumber = Int(secondStringNumber) ?? 0
        
        return firstNumber + secondNumber
    }
}
