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
