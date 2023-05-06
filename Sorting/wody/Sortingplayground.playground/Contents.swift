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

/*
 https://leetcode.com/problems/intersection-of-two-arrays/
 349. Intersection of Two Arrays

 이미 있는걸 또 구현해야하다니...🧐
 그럼 이미 있는걸 써야지!
 */

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Array(Set(nums1).intersection(Set(nums2)))
}

print(intersection([4,9,5], [9,4,9,8,4]))

/*
 https://leetcode.com/problems/sort-integers-by-the-power-value/
 1387. Sort Integers by The Power Value

 * 문제 설명
 정수 x의 power는 다음 단계를 사용하여 x를 1로 변환하는 데 필요한 단계 수로 정의됩니다.

 - x가 짝수이면 x = x / 2
 - x가 홀수이면 x = 3 * x + 1

 예를 들어, x = 3의 power는 7입니다.
 왜냐하면 3은 1이 될 때까지 7단계가 필요합니다
 (3 → 10 → 5 → 16 → 8 → 4 → 2 → 1).

 세 개의 정수 lo, hi 및 k가 주어집니다.
 범위 [lo, hi] 내의 모든 정수를 power 값의 오름차순으로 정렬하고,
 동일한 power 값을 가진 두 개 이상의 정수는 해당 정수들의 오름차순으로 정렬합니다.
 마지막으로, 정렬된 리스트에서 k번째 정수를 반환합니다.

 주어진 범위 [lo, hi] 내의 모든 정수 x는 이러한 단계를 사용하여 1로 변환될 것이며,
 x의 power는 32비트 부호 있는 정수로 표현할 수 있습니다.

 * 풀이 설계
 1. lo부터 hi 까지의 배열 nums가 있고 값 num을 순회한다.
 2. 순회하면서 num에 대한 power value를 구하고 딕셔너리에 저장한다.
 3. power value 딕셔너리의 value를 오름차순으로 정렬, 만약 value가 같다면 key의 오름차순 정렬
 4. 정렬된 딕셔너리의 key만 map
 5. 4번의 배열에서 k-1 인덱스 값 반환

 */
func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {

    var powerValues: [Int: Int] = [:]

    func power(value: Int, count: Int = 0) -> (value: Int, count: Int) {
        if value == 1 {
            return (value, count)
        }

        if value.isEven {
            return power(value: value / 2, count: count + 1)
        } else {
            return power(value: (3 * value) + 1, count: count + 1)
        }
    }

    for num in lo...hi {
        let powerValue = power(value: num)
        powerValues[num] = powerValue.count
    }

    let sortedPowerValues = powerValues
        .sorted {
            if $0.value == $1.value {
                return $0.key < $1.key
            }
            return $0.value < $1.value
        }
        .map { $0.key }

    return sortedPowerValues[k-1]
}

print(getKth(1, 1000, 777))
