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

