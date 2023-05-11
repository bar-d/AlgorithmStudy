import Foundation

// MARK: - 969. Pancake Sorting

class Solution5 {
    
    /**
     팬케이크 플립이 발생한 숫자들
     1. 배열에서 최대값을 찾는다.
     2. 최대값이 이미 정렬된 위치에 있으면 건너뛴다.
     3. 최대값이 배열의 첫 번째가 아니면, 최대값을 배열의 첫 번째로 이동시킨다.
     4. 최대값을 배열의 마지막 위치로 이동시킨다.
     5. 이동한 최대값의 위치를 결과 배열에 추가한다.
     6. 다음 최대값을 찾기 위해 배열의 길이를 하나 줄인다.
     7. 배열이 전부 정렬될 때까지 위 과정을 반복한다.
     */
    func pancakeSort(_ arr: [Int]) -> [Int] {
        var result = [Int]() // 정렬된 결과값을 담을 배열
        var arr = arr // 입력 배열 복사
        var n = arr.count // 입력 배열의 길이
        
        while n > 0 { // 배열이 전부 정렬될 때까지 반복
            var maxIndex = 0 // 최대값이 있는 인덱스를 저장하는 변수
            for i in 0 ..< n { // 배열의 0부터 n-1까지 반복
                if arr[i] > arr[maxIndex] { // 최대값을 찾는다
                    maxIndex = i
                }
            }
            
            if maxIndex == n - 1 { // 최대값이 이미 정렬된 위치에 있는 경우, 건너뛴다
                n -= 1
                continue
            }
            
            if maxIndex > 0 { // 최대값이 배열의 첫 번째가 아닌 경우, 최대값을 배열의 첫 번째로 이동시킨다
                flip(&arr, maxIndex)
                result.append(maxIndex + 1)
            }
            
            flip(&arr, n - 1) // 최대값을 배열의 마지막 위치로 이동시킨다
            result.append(n) // 최대값이 이동한 위치를 결과 배열에 추가한다
            n -= 1 // 다음 최대값을 찾기 위해 배열의 길이를 하나 줄인다
        }
        
        return result
    }

    func flip(_ arr: inout [Int], _ index: Int) { // 배열의 0부터 index까지 뒤집는 함수
        var i = 0
        var j = index
        while i < j {
            arr.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
}
