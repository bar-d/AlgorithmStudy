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

//MARK: - 349. Intersection of Two Arrays

class Solution3 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return Array(Set(nums1).intersection(Set(nums2)))
    }
}

//MARK: - 1387. Sort Integers by The Power Value

class Solution4 {
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        return Array(lo...hi)
            .map { num -> (Int, Int) in
                var temp = num, count = 0
                while temp != 1 {
                    count += 1
                    if temp % 2 == 0 { temp /= 2 }
                    else { temp = 3 * temp + 1 }
                }
                return (num, count)
            }
            .sorted {
                if $0.1 == $1.1 { return $0.0 < $1.0 }
                return $0.1 < $1.1
            }[k - 1].0
    }
}

//MARK: - 969. Pancake Sorting

class Solution5 {
    func pancakeSort(_ arr: [Int]) -> [Int] {
        let answer = arr.sorted()
        var sortedArr = answer
        var arr = arr, result = [Int](), swap = arr.count
        if arr == sortedArr { return result }
        
        while arr != answer {
            var temp = [Int](), last = [Int](), isRevers = false, count = 0
            arr.forEach {
                count += 1
                if isRevers {
                    last.append($0)
                    return
                }
                temp.append($0)
                if sortedArr.last == $0 {
                    sortedArr.popLast()
                    isRevers = true
                    temp.reverse()
                    result.append(count)
                }
            }
            
            arr = [temp, last].flatMap { $0 }
            var swapArray = arr.prefix(swap)
            let lastArray = arr.suffix(arr.count - swap)
            arr = Array(swapArray.reversed()) + lastArray
            result.append(swap)
            swap -= 1
        }
        return result
    }
}
