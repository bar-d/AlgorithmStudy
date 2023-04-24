// MARK: - https://leetcode.com/problems/count-common-words-with-one-occurrence/description/?languageTags=swift

func countWords(_ words1: [String], _ words2: [String]) -> Int {
    var words1Dictionary: [String: Int] = [:]
    var words2Dictionary: [String: Int] = [:]
    
    for word in words1 {
        if words1Dictionary[word] == nil {
            words1Dictionary[word] = 1
        } else {
            words1Dictionary[word]! += 1
        }
    }
    
    for word in words2 {
        if words2Dictionary[word] == nil {
            words2Dictionary[word] = 1
        } else {
            words2Dictionary[word]! += 1
        }
    }
    
    var setWords1 = Set(
        words1Dictionary
            .filter { $0.value == 1 }
            .map { $0.key }
    )
    
    var setWords2 = Set(
        words2Dictionary
            .filter { $0.value == 1 }
            .map { $0.key }
    )
    
    return setWords1.intersection(setWords2).count
}

// MARK: - https://leetcode.com/problems/count-pairs-of-similar-strings/description/

func similarPairs(_ words: [String]) -> Int {
    var count = 0
    
    for i in 0..<words.count {
        for l in (i + 1)..<words.count {
            let firstWord = Set(words[i])
            let secondWord = Set(words[l])
            
            if firstWord == secondWord {
                count += 1
            }
        }
    }
    
    return count
}

// MARK: - https://leetcode.com/problems/check-distances-between-same-letters/description/

func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
    var dictionary = [Character: Int]()
    
    for (index, character) in Array(s).enumerated() {
        if let firstIndex = dictionary[character],
           index - 1 - firstIndex != distance[Int(character.asciiValue!) - 97] {
            return false
        } else {
            dictionary[character] = index
        }
    }
    
    return true
}
