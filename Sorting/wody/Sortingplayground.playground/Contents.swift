import UIKit

/*
 https://leetcode.com/problems/split-with-minimum-sum/
 2578. Split With Minimum Sum
 최소 합계로 분할

 숫자 num이 주어지면 각 숫자를 분할
 분할된 숫자의 합이 최소합이 되도록 반환

 1. num을 분할하여 array 형태로 변환
 2.

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
