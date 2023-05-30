//MARK: - 338. Counting Bits

class Solution1 {
    func countBits(_ n: Int) -> [Int] {
        var binaryCount = [Int]()
        for i in 0...n {
            let binary = String(i, radix: 2)
            let count = binary.filter { $0 == "1" }.count
            binaryCount.append(count)
        }
        return binaryCount
    }
}
