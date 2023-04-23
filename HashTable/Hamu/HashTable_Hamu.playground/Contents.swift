import Foundation

//MARK: - 2085. Count Common Words With One Occurrence

class Solution1 {
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

//MARK: - 2506. Count Pairs Of Similar Strings

class Solution2 {

    func similarPairs(_ words: [String]) -> Int {
        let words = words.map { Set($0) }
        var result = 0

        words.enumerated().forEach { index, word in
            for i in (index + 1)..<words.count {
                if word == words[i] {
                    result += 1
                }
            }
        }
        
        return result
    }
}

//MARK: - 2399. Check Distances Between Same Letters

class Solution3 {
    func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
        let s = s.map { $0 }
        var map = Array(repeating: false, count: s.count)
        var result = true
        
        s.enumerated().forEach { index, char in
            if map[index] || !result { return }
            guard let ascii = char.asciiValue,
                  let asciiIndex = Character("a").asciiValue else { return }
            let i = distance[Int(ascii - asciiIndex)] + index + 1
            
            if i >= s.count {
                result.toggle()
                return
            }
            if char != s[i] {
                result.toggle()
                return
            }
            map[i] = true
        }
        
        return result
    }
}

let solution = Solution3()
print(solution.checkDistances("abbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzza", [50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0]))
