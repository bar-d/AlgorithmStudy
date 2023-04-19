import UIKit

/*
 https://leetcode.com/problems/count-common-words-with-one-occurrence/

 2085. Count Common Words With One Occurrence
 */
func countWords(_ words1: [String], _ words2: [String]) -> Int {
    let intersectionWords = Set(words1).intersection(Set(words2))

    var result = 0

    intersectionWords.forEach { word in
        var words1Count = words1
            .filter { $0 == word }
            .count

        var words2Count = words2
            .filter { $0 == word }
            .count

        if words1Count == 1,
           words2Count == 1 {
            result += 1
        }
    }

    return result
}

print(countWords(["a","ab"], ["a","a","a","ab"]))



/*
 https://leetcode.com/problems/count-pairs-of-similar-strings/

 2506. Count Pairs Of Similar Strings
 */
func similarPairs(_ words: [String]) -> Int {
    var result = 0
    let setWords = words
        .map { Set($0.unicodeScalars.map(String.init)) }

    for i in 0..<(setWords.count-1) {
        for j in (i+1)..<setWords.count {
            if setWords[i].symmetricDifference(setWords[j]).count == 0 {
                result += 1
            }
        }
    }

    return result
}

similarPairs(["aba","aabb","abcd","bac","aabc"])
