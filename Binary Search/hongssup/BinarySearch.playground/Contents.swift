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

// MARK: - https://leetcode.com/problems/longest-subsequence-with-limited-sum/description/

func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
    var nums = nums.sorted()
    var sums = Array(repeating: 0, count: nums.count + 1)
    var result = [Int]()
    
    for i in 1...nums.count {
        sums[i] = sums[i-1] + nums[i-1]
    }
    
    for i in queries {
        result.append(binarySearch(sums, i))
    }
    
    return result
}

func binarySearch(_ sums: [Int], _ query: Int) -> Int {
    var s = 0
    var e = sums.count
    
    while s < e {
        let mid = (s + e) / 2
        if sums[mid] <= query {
            s = mid + 1
        } else {
            e = mid
        }
    }
    return s - 1
}
