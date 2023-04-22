import Foundation

//MARK: - 2085. Count Common Words With One Occurrence

class Solution {
    func addCount(map: [String: Int], words: [String], isSecond: Bool = false) -> [String: Int] {
        var map = map
        words.forEach { word in
            guard let count = map[word] else {
                if isSecond { return }
                map[word] = 1
                return
            }
            map[word] = count + 1
        }
        return map
    }
    
    func countWords(_ words1: [String], _ words2: [String]) -> Int {
        var wordCountMap = addCount(map: [String: Int](), words: words1)
        wordCountMap = wordCountMap.filter { $0.1 == 1 }
        wordCountMap = addCount(map: wordCountMap, words: words2, isSecond: true)
        wordCountMap = wordCountMap.filter { $0.1 == 2 }
        
        return wordCountMap.count
    }
}
