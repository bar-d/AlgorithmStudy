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

/*
 https://leetcode.com/problems/check-distances-between-same-letters/
 2399. Check Distances Between Same Letters
 */

func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
    var result = true
    let strings = s.map { String($0) }
    let uniqueString = Set(strings)

    for char in uniqueString {
        let charIndex = Int(UnicodeScalar(char)?.value ?? 0) - 97
        let firstIndex = (strings.firstIndex(of: char) ?? 0)
        let lastIndex = (strings.lastIndex(of: char) ?? 0)
        let distanceCount: Int = Int(lastIndex - firstIndex) - 1
        let targetDistance = distance[charIndex]

        if distanceCount != targetDistance {
            result = false
            break
        }
    }

    return result
}

checkDistances("abbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzza", [49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0])

/*
 https://leetcode.com/problems/sort-characters-by-frequency/
 451. 빈도별로 문자 정렬
 */

func frequencySort(_ s: String) -> String {
    let chars = Array(s).map { String($0) }
    var dict: [String: Int] = [:]

    for char in chars {
        dict[char] = (dict[char] ?? 0) + 1
    }

    let sortedDict = dict.sorted { first, second in
        if first.value == second.value {
            return first.key < second.key
        }
        return first.value > second.value
    }

    var result: String = ""

    sortedDict.forEach { element in
        for i in 0..<element.value {
            result += element.key
        }
    }

    return result
}
