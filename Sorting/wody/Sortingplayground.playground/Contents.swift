import UIKit

/*
 https://leetcode.com/problems/split-with-minimum-sum/
 2578. Split With Minimum Sum
 최소 합계로 분할

 숫자 num이 주어지면 각 숫자를 분할
 분할된 숫자의 합이 최소합이 되도록 반환

 1. num을 분할하여 array 형태로 변환
 2. 숫자를 오름차순으로 정렬
 3. 순차적으로 num1과 num2로 분배

 */

func splitNum(_ num: Int) -> Int {

    // 1. num의 숫자를 Int -> [String] 형태로 변환
    let nums = String(num).map { String($0) }

    // 2. 낮은 숫자대로 정렬
    let sortedNums = nums.sorted(by: <)

    // 3. 각 낮은 숫자를 순서대로 num1과 num2에 분배
    var num1 = ""
    var num2 = ""

    for (index, num) in sortedNums.enumerated() {
        if index % 2 == 0 {
            // num1
            num1 += num
        } else {
            // num2
            num2 += num
        }
    }

    return (Int(num1) ?? 0) + (Int(num2) ?? 0)
}

splitNum(4325)

/*
 https://leetcode.com/problems/sort-array-by-parity-ii/
 922. Sort Array By Parity II

 1. nums와 동일한 elment count를 가진 [Int] 생성
 2. nums를 순회하며 짝수, 홀수 분리
 3. nums index를 순회하며 index가 짝수일 경우 짝수 대입, 홀수일 경우 홀수 대입

 */

extension Int {
    var isEven: Bool {
        if self % 2 == 0 {
            return true
        } else {
            return false
        }
    }
}

func sortArrayByParityII(_ nums: [Int]) -> [Int] {

    var result = Array(repeating: 0, count: nums.count)
    var evenNums: [Int] = []
    var oddNums: [Int] = []

    for num in nums {
        if num.isEven {
            evenNums.append(num)
        } else {
            oddNums.append(num)
        }
    }

    for (index, _) in result.enumerated() {
        if index.isEven {
            result[index] = evenNums.popLast() ?? 0
        } else {
            result[index] = oddNums.popLast() ?? 0
        }
    }

    return result
}

print(sortArrayByParityII([4,2,5,7]))
