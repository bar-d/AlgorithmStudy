/*
 https://leetcode.com/problems/count-pairs-of-similar-strings/submissions/938944005/
 
 2506. Count Pairs Of Similar Strings
 
 You are given a 0-indexed string array words.

 Two strings are similar if they consist of the same characters.

 For example, "abca" and "cba" are similar since both consist of characters 'a', 'b', and 'c'.
 However, "abacba" and "bcfd" are not similar since they do not consist of the same characters.
 Return the number of pairs (i, j) such that 0 <= i < j <= word.length - 1 and the two strings words[i] and words[j] are similar.
 */



class Solution {
    func similarPairs(_ words: [String]) -> Int {
        let words = words.map { Set($0) }
        var result = 0

        words.enumerated().forEach {
            var totalPair = 0
            print($0, $1)
            for i in ($0 + 1)..<words.count {
                if $1 == words[i] {
                    totalPair += 1
                }
            }

            result += totalPair
        }
        return result
    }
}
