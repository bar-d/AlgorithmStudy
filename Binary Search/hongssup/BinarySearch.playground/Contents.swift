// MARK: - https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/

func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
    var dict = [Int:Int]()
    var result = [Int]()
    for (i, element) in mat.enumerated() {
        dict.updateValue(binarySearch(element), forKey: i)
    }
    let tuple = dict.sorted(by: { ($0.1, $0.0) < ($1.1, $1.0) })
    for i in 0..<k {
        result.append(tuple[i].key)
    }
    return result
}

func binarySearch(_ arr: [Int]) -> Int {
    var start = 0
    var end = arr.count
    
    while start < end {
        let mid = (start + end) / 2
        if arr[mid] == 1 {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return start
}
