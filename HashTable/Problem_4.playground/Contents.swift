// 451. Sort Characters By Frequency
// https://leetcode.com/problems/sort-characters-by-frequency/description/

class Solution {
    func frequencySort(_ s: String) -> String {
        var dict = [Character:Int]()
        
        for i in s {
            dict[i, default: 0] += 1
        }
            
        let sorted = dict.sorted{ $0.1 > $1.1 }
        
        var result = ""
            
        for (key, value) in sorted {
            for i in 1...value {
                result.append(key)
            }
        }
            
        return result
    }
}
