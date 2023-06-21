// MARK: - https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/

// 이진탐색 X
func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
    var rows = [(Int, Int)]()
    for i in 0..<mat.count {
        let numOnes = mat[i].reduce(0, +)
        rows.append((numOnes, i)) // (1의 개수, 인덱스)
    }
    rows.sort { a, b in
        if a.0 != b.0 { // 1의 개수가 다르다면
            return a.0 < b.0 // 1의 개수를 기준으로 오름차순으로 정렬
        } else { // 1의 개수가 같다면
            return a.1 < b.1 // 인덱스를 기준으로 오름차순으로 정렬
        }
    }
    var result = [Int]()
    for i in 0..<k { // k번째로 최소인 요소를 찾아낼 때까지 반복
        result.append(rows[i].1) // 해당 인덱스 추가
    }
    return result
}

// 써비 코드 참고
class Solution1 {
    func kWeakestRows2(_ mat: [[Int]], _ k: Int) -> [Int] {
        var dict = [Int:Int]() // 행 인덱스와 해당 행에서 1의 개수를 저장할 딕셔너리
        var result = [Int]()
        
        // matrix의 각 행에 대해 이진 탐색을 수행하여 1의 개수를 찾고 딕셔너리에 저장
        for (i, element) in mat.enumerated() {
            dict.updateValue(binarySearch(element), forKey: i)
        }
        
        // 딕셔너리를 정렬하여 1의 개수와 행 인덱스 순으로 오름차순 정렬
        let tuple = dict.sorted(by: { ($0.1, $0.0) < ($1.1, $1.0) })
        
        // 정렬된 결과에서 가장 약한 행 k개를 선택하여 결과 배열에 추가
        for i in 0..<k {
            result.append(tuple[i].key)
        }
        
        return result
    }
    
    func binarySearch(_ arr: [Int]) -> Int {
        var start = 0 // 이진 탐색 시작 인덱스
        var end = arr.count // 이진 탐색 종료 인덱스
        
        // 이진 탐색 실행
        while start < end {
            let mid = (start + end) / 2 // 중간 인덱스 계산
            if arr[mid] == 1 { // 중간 인덱스 값이 1인 경우
                start = mid + 1 // 탐색 범위를 오른쪽으로 이동
            } else { // 중간 인덱스 값이 0인 경우
                end = mid // 탐색 범위를 왼쪽으로 이동
            }
        }
        return start // 1의 개수 반환
    }
}

// MARK: - https://leetcode.com/problems/longest-subsequence-with-limited-sum/

// 이진탐색 X
func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
    var ans: [Int] = []
    let sortedNums = nums.sorted()
    
    for query in queries {
        var count = 0
        var sum = 0
        
        for num in sortedNums {
            if sum + num <= query { // num을 추가해도 합이 query 이하인 경우
                sum += num
                count += 1
            } else { // 최대 부분수열 크기에 도달했거나, 추가로 num을 더하면 합이 query 초과인 경우
                break
            }
        }
        ans.append(count)
    }
    return ans
}

// 다른 코드 참고
class Solution2 {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        var nums = nums.sorted() // nums를 오름차순 정렬
        
        // 숫자들의 누적 합 계산
        for i in stride(from: 1, to: nums.count, by: 1) {
            nums[i] += nums[i-1]
        }
        
        var answer = [Int]() // 결과를 저장할 배열 초기화
        answer.reserveCapacity(queries.count) // query 개수만큼 예약
        
        // 각 query에 대해 이진 탐색 수행 및 결과 저장
        for query in queries {
            answer.append(binarySearch(nums, for: query))
        }
        
        return answer // 결과를 반환
    }
    
    private func binarySearch(_ nums: [Int], for num: Int) -> Int {
        var left = 0 // 탐색 시작 인덱스
        var right = nums.count-1 // 탐색 종료 인덱스
        
        // 이진 탐색 진행
        while left <= right {
            let mid = left + (right-left) / 2 // 중간 인덱스 계산
            if nums[mid] <= num { // 중간 값이 찾고자 하는 값보다 작거나 같으면
                left = mid + 1 // 탐색 범위를 오른쪽으로 이동
            } else {
                right = mid - 1 // 미수가 찾고자 하는 값보다 크면 탐색 범위를 왼쪽으로 이동
            }
        }
        
        return left // 최대 부분수열의 크기 반환
    }
}

// MARK: - https://leetcode.com/problems/find-the-distance-value-between-two-arrays/

// 이진탐색 X
func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
    var count = 0
    for num1 in arr1 {
        var match = false // 매칭 여부를 저장할 match 변수를 초기화합니다.
        for num2 in arr2 {
            if abs(num1 - num2) <= d { // 주어진 조건을 만족하는 요소가 하나라도 있을 경우
                match = true // match 값을 true로 수정
                break // 불필요한 탐색을 최소화하기 위해 for문을 바로 종료
            }
        }
        if !match { // 모든 요소들에 대해 주어진 조건을 만족시키지 않았을 경우
            count += 1 // count를 증가
        }
    }
    return count
}

// 다른 풀이 참고
class Solution3 {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        var arr2 = arr2.sorted(), cnt = 0 // arr2를 정렬하고 cnt 변수 초기화
        for num in arr1{
            if !binarySearch(num){ // num이 이진 탐색 결과 거리가 d보다 큼
                cnt += 1 // cnt를 증가시킴
            }
        }
        func binarySearch(_ num: Int) -> Bool{ // 이진탐색 함수 정의
            var l = 0, r = arr2.count-1, m = l+(r-l)/2 // l, r, m 변수 초기화
            while l<=r { // 반복문 진행
                m = l+(r-l)/2 // 중간 인덱스 계산
                if abs(num-arr2[m]) <= d { // 거리가 d 이하면 true 반환
                    return true
                }
                else if arr2[m] > num { // 중간 값이 num보다 크면 탐색 범위 줄임
                    r = m-1
                }
                else if arr2[m] < num { // 중간 값이 num보다 작으면 탐색 범위 늘임
                    l = m+1
                }
            }
            return false // 거리가 d보다 크면 false 반환
        }
        return cnt // 거리 d보다 큰 쌍의 개수 반환
    }
}
