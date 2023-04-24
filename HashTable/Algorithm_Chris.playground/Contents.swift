class Solution {
    func countWords(_ words1: [String], _ words2: [String]) -> Int {
        var dictionary1 = [String: Int]()
        var dictionary2 = [String: Int]()

        for word in words1 {
            if dictionary1[word] == nil {
                dictionary1[word] = 1
            } else {
                dictionary1[word]! += 1
            }
        }

        for word in words2 {
            if dictionary2[word] == nil {
                dictionary2[word] = 1
            } else {
                dictionary2[word]! += 1
            }
        }

        return dictionary1.filter {
            guard $1 == 1 else { return false }
            return dictionary2[$0] == 1
        }
        .count
    }
}
