import Foundation

//MARK: - 2578. Split With Minimum Sum

class Solution1 {
    func splitNum(_ num: Int) -> Int {
        var num = String(num).sorted()
        
        func split(_ num: [String.Element], _ filterNum: Int) -> String {
            return num
                .enumerated()
                .filter { $0.offset % 2 == filterNum }
                .map { String($0.element) }
                .joined()
        }
        
        let sum1 = split(num, 0)
        let sum2 = split(num, 1)
        
        return Int(sum1)! + Int(sum2)!
    }
}

//MARK: - 922. Sort Array By Parity II

class Solution2 {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var splitNum = Array(repeating: [Int](), count: 2)
        nums.forEach { splitNum[$0 % 2].append($0) }
        
        return Array(0..<nums.count)
            .map { splitNum[$0 % 2].popLast() }
            .compactMap { $0 }
    }
}

