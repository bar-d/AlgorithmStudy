// MARK: - https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/

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
