import Foundation

// MARK: - 1387. Sort Integers by The Power Value

class Solution4 {
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        
        var lowToHighArray = Array(lo...hi).sorted {
            let isEqualPower: Bool = getPowerNumber($0) == getPowerNumber($1) ? true : false
            // 파워 값이 동일한 경우에는 정렬된 순서대로 정렬 : 그렇지 않으면 파워값을 기준으로 오름차순 정렬
            return isEqualPower ? $0 < $1 : getPowerNumber($0) < getPowerNumber($1)
        }
        
        return lowToHighArray[k-1]
    }

    func getPowerNumber(_ x: Int, _ count: Int = 0) -> Int {
        if x == 1 {
            return count
        }
        return x % 2 == 0 ? getPowerNumber(x / 2, count + 1) : getPowerNumber(3 * x + 1, count + 1)
    }
}
