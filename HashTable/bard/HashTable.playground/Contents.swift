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
