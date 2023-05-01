import UIKit

/*
 https://leetcode.com/problems/next-greater-element-i/
 496. Next Greater Element I

 1. nums 1을 순환하면서 nums2에 해당하는 targetIndex 찾기
 2. targetIndex 기준으로 num1 보다 큰 num2 있는지 찾기
 3. 있다면 해당 숫자를 result에 포함
 4. 없다면 -1을 result에 포함
 */

func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result: [Int] = []

    for num1 in nums1 {
        var isGreater = false
        let targetIndex = nums2.firstIndex(of: num1) ?? 0

        for num2 in nums2[targetIndex..<nums2.count] {
            if num1 < num2 {

                isGreater = true
                result.append(num2)
                break
            }
        }

        if !isGreater {
            result.append(-1)
        }
    }

    return result
}

/*
 https://leetcode.com/problems/binary-tree-inorder-traversal/
 94. Binary Tree Inorder Traversal

 중위 노드 탐색
 재귀 함수 사용
 */

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result: [Int] = []

    func innerInorderTraversal(node: TreeNode?) {
        guard let node = node else { return }

        innerInorderTraversal(node: node.left)
        result.append(node.val)
        innerInorderTraversal(node: node.right)
    }

    innerInorderTraversal(node: root)

    return result
}

/*
 https://leetcode.com/problems/baseball-game/
 682. Baseball Game

 1. operations를 순회하며 각 계산법에 해당하는 string 조건문에 따라 연산
 2. 결과 합산하여 반환
 */

func calPoints(_ operations: [String]) -> Int {
    var recordScore: [Int] = []

    operations.forEach { operation in
        if let num = Int(operation) {
            recordScore.append(num)
        }

        // let invaildLastScore
        if operation == "C" {
            recordScore.popLast()
        }

        if operation == "D" {
            let lastScore = recordScore.last ?? 0
            recordScore.append(lastScore * 2)
        }

        if operation == "+" {
            var copyRecordScore = recordScore
            var plusScore = (copyRecordScore.popLast() ?? 0) + (copyRecordScore.popLast() ?? 0)
            recordScore.append(plusScore)
        }
    }

    return recordScore.reduce(0, +)
}

/*
 https://leetcode.com/problems/build-an-array-with-stack-operations/
 1441. Build an Array With Stack Operations

 영어 지문 어려워요,...
 스택 방식으로 배열 만들기
 1. 일단 push
 2. 해당하지 않으면 pop
 3. 순환 중 target과 동일해지면 동작 중단하고 반환
 */

func buildArray(_ target: [Int], _ n: Int) -> [String] {
    var result: [String] = []
    var intResult: [Int] = []

    for stream in 1...n {
        if target.contains(stream) {
            result.append("Push")
            intResult.append(stream)
        } else {
            result.append("Push")
            result.append("Pop")
        }

        if target == intResult {
            break
        }
    }

    return result
}
