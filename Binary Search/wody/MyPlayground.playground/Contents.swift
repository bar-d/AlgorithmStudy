import UIKit

/*
 https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/
 1337. The K Weakest Rows in a Matrix

 행렬에서 K개의 가장 약한 행

 1이 가장 적게 있는 행부터 나열
 */

func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
    guard !mat.isEmpty else { return [] }

    let values = mat
        .map { $0.reduce(0, +) } // 각 row의 합을 구합니다.
        .enumerated() // row의 인덱스를 가져옵니다.
        .map { ($0, $1) } // (row의 인덱스, row의 합) 튜플로 바꿉니다.
        .sorted(by: { $0.1 < $1.1 }) // row의 합 오름차순으로 정렬합니다.
        .enumerated() // 오름차순 기준으로 인덱스를 가져옵니다.
        .filter { $0.offset < k } // 오름차순 기준으로 정렬한 배열의 k번째 요소까지만 가져옵니다.
        .map { $1.0 } // row의 인덱스 만 데이터를 가져옵니다.

    return values
}

print(kWeakestRows([[1,1,0,0,0],
                    [1,1,1,1,0],
                    [1,0,0,0,0],
                    [1,1,0,0,0],
                    [1,1,1,1,1]], 3))

/*
 https://leetcode.com/problems/longest-subsequence-with-limited-sum/
 2389. Longest Subsequence With Limited Sum
 합이 제한된 가장 긴 하위 시퀀스

 nums와 queries가 주어집니다.

 nums에 있는 요소들의 합이 각 querie의 값보다 작거나 같은 숫자가 되는 가장 긴 하위 시퀸스의 길이를 반환하세요

 1. nums를 오름차순으로 정렬합니다.
 2. 각 queries를 순회합니다.
 3. 오름차순으로 정렬한 nums의 요소를 비교할 배열 target: [Int]에 push하면서 querie보다 큰 숫자가 나올 때 까지 push합니다.
 4. target의 합이 쿼리보다 커지면 마지막 push 요소를 pop하고 target의 count를 반환합니다.
 */

func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
    guard !nums.isEmpty,
          !queries.isEmpty
    else { return [] }

    var sortedNums = nums.sorted()

    return queries.map { querie in
        var target = [Int]()
        var targetNum: Int = 0

        for num in sortedNums {
            guard num <= querie else { break }
            target.append(num)

            if querie < target.reduce(0, +) {
                target.popLast()
                targetNum = target.count
                break
            } else {
                targetNum = target.count
            }
        }

        return targetNum
    }
}

print(answerQueries([4,5,2,1], [3,10,21]))

/*
 https://leetcode.com/problems/find-the-distance-value-between-two-arrays/
 1385. Find the Distance Value Between Two Arrays
 두 배열 사이의 거리 값 찾기...?

 주어진 d 보다 |arr[i]-arr[j]| 값이 작다면 그건 배제

 두 배열 사이의 거리가 d보다 큰 배열의 갯수를 반환하자
 */
func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
    var distanceValues: [Int] = []

    for num1 in arr1 {
        var isDistanceValue = true

        for num2 in arr2 {
            if abs(num1 - num2) <= d {
                isDistanceValue = false
                break
            }
        }

        if isDistanceValue {
            distanceValues.append(num1)
        }
    }

    return distanceValues.count
}

print("### distance : \(findTheDistanceValue([1,4,2,3], [-4,-3,6,10,20,30], 3))")
