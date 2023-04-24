import Foundation

//MARK: - 2085. Count Common Words With One Occurrence

class Solution1 {
    func countWords(_ words1: [String], _ words2: [String]) -> Int {
        var dict1 = [String:Int]()
        var dict2 = [String:Int]()
        var result = 0
        
        for word in words1 {
            dict1[word, default: 0] += 1
        }
        
        for word in words2 {
            dict2[word, default: 0] += 1
        }
        
        for (key, value) in dict1 {
            if value == 1 && dict2[key] == 1 {
                result += 1
            }
        }
        
        return result
    }
}

//MARK: - 2506. Count Pairs Of Similar Strings

class Solution2 {
    func similarPairs(_ words: [String]) -> Int {
        var dict: [String:Int] = [:]
        var result = 0
        
        for word in words {
            let key = Set(word).sorted().map { String($0) }.joined()
            dict[key, default: 0] += 1
        }
        for (_, value) in dict {
            result += (value * (value - 1)) / 2
        }
        return result
    }
}

//MARK: - 2399. Check Distances Between Same Letters

class Solution3 {
    func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
        var dict: [Character:Int] = [:]
        let array = s.map { $0 }
        
        for i in 0..<array.count {
            if let first = dict[array[i]] {
                dict[array[i]] = i - first - 1
            } else {
                dict[array[i]] = i
            }
        }
        
        for (key, value) in dict {
            let index = key.asciiValue! - Character("a").asciiValue!
            if value != distance[Int(index)] {
                return false
            }
        }
        
        return true
    }
}
