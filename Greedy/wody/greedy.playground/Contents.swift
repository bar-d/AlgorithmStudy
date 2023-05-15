import UIKit

/*
 https://leetcode.com/problems/two-furthest-houses-with-different-colors/

 2078. Two Furthest Houses With Different Colors

 서로 다른 색상이 있는 배열이 주어진다 (이 때 색상은 다른 Int 값)
 색상이 다른 두 요소간 최대 거리를 반환해야 한다.

 풀이설계
 1. 색상의 종류를 구한다.
 2. 각 색상 종류별 거리비교 조합을 구한다.
 3. 각 조합별 최대 거리를 구한다. max(abs(첫번째 - 마지막)), abs(마지막 - 첫번째))
 3. 각 조합별 최대 거리 중 최대 거리를 반환한다.

 코멘트
 은행에선 네이밍을 한글로 짓는 경우도 있다고 들어 한번 한글로 지어서 풀어봤습니다.
 작성할 땐 쉬워서 좋았는데 작성된 코드를 읽을 때 다 비슷해 보여서(?) 조금 어렵네요.
 */

func maxDistance(_ colors: [Int]) -> Int {
    let 컬러셋 = Array(Set(colors))
    var 컬러조합들: [(기준: Int, 상대: Int)] = []
    var 컬러조합별최대거리: Int = 0

    for 기준인덱스 in 0..<(컬러셋.count-1) {
        let 기준컬러: Int = 컬러셋[기준인덱스]
        for 상대인덱스 in (기준인덱스+1)..<컬러셋.count {
            let 상대컬러: Int = 컬러셋[상대인덱스]

            컬러조합들.append((기준컬러, 상대컬러))
        }
    }

    for 컬러조합 in 컬러조합들 {
        let 기준컬러첫번째인덱스 = colors.firstIndex(of: 컬러조합.기준) ?? 0
        let 기준컬러마지막인덱스 = colors.lastIndex(of: 컬러조합.기준) ?? 0

        let 상대컬러첫번째인덱스 = colors.firstIndex(of: 컬러조합.상대) ?? 0
        let 상대컬러마지막인덱스 = colors.lastIndex(of: 컬러조합.상대) ?? 0

        let 최대거리 = max(abs(기준컬러첫번째인덱스 - 상대컬러마지막인덱스), abs(기준컬러마지막인덱스 - 상대컬러첫번째인덱스))

        if 컬러조합별최대거리 < 최대거리 {
            컬러조합별최대거리 = 최대거리
        }
    }

    return 컬러조합별최대거리
}

print(maxDistance([1,8,3,8,3]))


/*
 https://leetcode.com/problems/minimum-number-of-operations-to-convert-time/
 2224. Minimum Number of Operations to Convert Time
 시간 변환을 위한 최소 작업 수

 current와 correct에 전달받는 시간은 24시간 표기법을 따릅니다.
 시간 변환에 증가하는 시간의 단위는 1, 5, 15, 60분 입니다.
 현재부터 목표 시간까지 시간 변환한이 이뤄진다면, 변환이 이뤄진 최소 작업 수를 반환하면 됩니다.

 ex) current = "02:30" -> correct = "04:35"
 output : 3
 1. Add 60분 : "02:30" -> "03:30"
 2. Add 60분 : "03:30" -> "04:30"
 3. Add 5분 : "04:30" -> "04:35"
 총 작업횟수 3회

 문제풀이 설계
 - String으로 들어오는 시간을 TimeInterval(Double)로 변환하면 쉽게 풀이할 수 있을 것 같다.
 - 시간 변환에 증가하는 단위를 정책(Policy)로 정의해 매직넘버를 줄여보자.

 1. String -> TimeInterval 변환
 2. 남은 분 산출 correct - current / 60
 2. 남은 분에서 각 작업 단위 실행
 */
enum Policy {
    static let oneMinuteSecond = 60
    static let oneMinute = 1
    static let fiveMinute = 5
    static let fifteenMinute = 15
    static let sixtyMinute = 60
}

extension String {
    var toTimeInterval: TimeInterval {
        guard self != "" else { return 0 }

        var timeInterval: Double = 0

        var separatedTime = self.components(separatedBy: ":")

        for (index, time) in separatedTime.reversed().enumerated() {
            timeInterval += (Double(time) ?? 0) * pow(Double(60), Double(index+1))
        }

        return timeInterval
    }
}

func convertTime(_ current: String, _ correct: String) -> Int {
    let remainingTime = Int(correct.toTimeInterval - current.toTimeInterval) / Policy.oneMinuteSecond
    let sixtyMinuteWorkNumber = remainingTime / Policy.sixtyMinute
    let fifteenMinuteWorkNumber = (remainingTime % Policy.sixtyMinute) / Policy.fifteenMinute
    let fiveMineteWorkNumber = ((remainingTime % Policy.sixtyMinute) % Policy.fifteenMinute) / Policy.fiveMinute
    let oneMineteWorkNumber = (((remainingTime % Policy.sixtyMinute) % Policy.fifteenMinute) % Policy.fiveMinute) / Policy.oneMinute

    return sixtyMinuteWorkNumber + fifteenMinuteWorkNumber + fiveMineteWorkNumber + oneMineteWorkNumber
}

print(convertTime("02:30", "04:35"))

/*
 https://leetcode.com/problems/k-items-with-the-maximum-sum/
 2600. K Items With the Maximum Sum

 합계가 최대인 K 항목

 numOnes에는 어레이에 1이 몇 개 있는지 나타냄
 numZeros에는 어래이에 0이 몇 개 있는지 나타냄
 numNegOnes는 어레이에 -1이 몇 개 있는지 나타냄
 k는 각 num이 사용되는 갯수를 나타냄

 k에 맞춰 num을 조합해 만들 수 있는 최대 Int를 반환하면 됨
 */

func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
    var result = 0

    var numOnesArray = Array(repeating: 1, count: numOnes)
    var numZerosArray = Array(repeating: 0, count: numZeros)
    var numNegOnesArray = Array(repeating: -1, count: numNegOnes)

    for _ in 0..<k {
        if let one = numOnesArray.popLast() {
            result += one
            continue
        }

        if numZerosArray.popLast() != nil {
            continue
        }

        if let neg = numNegOnesArray.popLast() {
            result += neg
            continue
        }
    }

    return result
}

print(kItemsWithMaximumSum(3, 2, 0, 2))

/*
 https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced/
 1963. Minimum Number of Swaps to Make the String Balanced

 문자열 균형을 유지하기 위한 최소 스왑의 수

 균형의 조건
 - 비어있는 문자열
 - AB로 표현할 수 있으며 A와 B 모두 균형잡힌 문자열
 - [C]로 표현될 수 있는 문자열



 */

func minSwaps(_ s: String) -> Int {
    var array = Array(s)
    var balancedArray: [Character] = []
    var result = 0

    for i in 0..<array.count {
        if array[i] == "[" {
            balancedArray.append(array[i])
        } else if !balancedArray.isEmpty {
            balancedArray.popLast()
        } else {
            let closeChar = array.firstIndex(of: "]") ?? 0
            array.swapAt(i, closeChar)
            result += 1
            balancedArray.append(array[i])
        }
    }

    return result
}

/*
 https://leetcode.com/problems/reduce-array-size-to-the-half/
 1338. Reduce Array Size to The Half
 어레이 크기를 절반으로 줄이기

 배열 정수의 절반 이상이 제거되도록 하는 집합의 최소 크기를 반환

 1. Set으로 조합 산출 elements
 2. element별 원소 갯수 반환
 3. count가 절반 이하가 될 때 까지 가장 큰 원소부터 제거
 3. 조합의 최소 크기 반환
 */

func minSetSize(_ arr: [Int]) -> Int {
    let targetCount = arr.count / 2
    let elements = Array(Set(arr))
    var elementsCount: [Int] = []
    var resultElements: [Int] = []

    // 각 element별 갯수
    for element in elements {
        let count = arr.filter { $0 == element }.count
        elementsCount.append(count)
    }

    elementsCount.sort(by: >)

    var testingCount = arr.count

    for count in elementsCount {
        testingCount -= count
        resultElements.append(count)

        if testingCount <= targetCount {
            testingCount = arr.count
            break
        }
    }

    return resultElements.count
}

print("### minSetSize: \(minSetSize([3,3,3,3,5,5,5,2,2,7]))")
