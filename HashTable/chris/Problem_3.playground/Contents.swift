class Solution {
    func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
        var visited:Set<Character> = Set()
        
        for char in s {
            if visited.contains(char) { continue }
            let index = s.firstIndex(of: char)!
            let asciiValue = Int(char.asciiValue!)
            let indexLast = s.lastIndex(of: char)!
            
            
            let dis  =  s.distance(from: index, to: indexLast) - 1
            if dis != distance[asciiValue - 97] {return false }
        }
        return true
    }
}
