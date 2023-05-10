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

//MARK: - 922. Sort Array By Parity II

class Solution2_1 {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var even = [Int]()
        var odd = [Int]()

        for num in nums {
            if num % 2 == 0 {
                even.append(num)
            } else {
                odd.append(num)
            }
        }

        var result = [Int]()
        for i in 0..<even.count {
            result.append(even[i])
            result.append(odd[i])
        }

        return result
    }
}

class Solution2_2 {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var result = Array(repeating:0, count:nums.count)
        var even = 0
        var odd = 1
        
        for num in nums{
            if num % 2 == 0{
                result[even] = num
                even += 2
            } else {
                result[odd] = num
                odd += 2
            }
        }
        return result
    }
}

//MARK: - 349. Intersection of Two Arrays

class Solution3_1 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int:Bool]()
        for i in nums1 {
            dict[i] = true
        }
        var result = [Int]()
        for i in Set(nums2) {
            if let _ = dict[i] {
                result.append(i)
            }
        }
        return result
    }
}

class Solution3_2 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return Array(Set(nums1).intersection(nums2))
    }
}

//MARK: - 1387. Sort Integers by The Power Value

class Solution4_1 {
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        var dict = [Int:Int]()
        for i in lo...hi {
            dict[i] = getPower(i)
        }
        let result = dict.sorted(by: { ($0.value, $0.key) < ($1.value, $1.key) })

        return result[k-1].key
    }

    func getPower(_ x: Int) -> Int {
        var x = x
        var power = 0
        while x != 1 {
            x = (x % 2 == 0) ? x / 2 : 3 * x + 1
            power += 1
        }
        return power
    }
}

class Solution4_2 {
    var dp: [Int:Int] = [1:0]

    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        var dict = [Int:Int]()
        for i in lo...hi {
            dict[i] = getPower(i)
        }
        let result = dict.sorted(by: { ($0.value, $0.key) < ($1.value, $1.key) })

        return result[k-1].key
    }

    func getPower(_ x: Int) -> Int {
        if let power = dp[x] {
            return power
        }
        let power = (x % 2 == 0) ? getPower(x/2) + 1 : getPower(3 * x + 1) + 1
        dp[x] = power

        return power
    }
}

