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
