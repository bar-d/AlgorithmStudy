import UIKit

struct TestType {
    var text: String?
    var url: String?

    init(text: String?, url: String?) {
        self.text = text
        self.url = url
    }
}

extension TestType: Equatable {
    static func == (lhs: TestType, rhs: TestType) -> Bool {
        lhs.text == rhs.text &&
        lhs.url == rhs.url
    }
}

let case1 = TestType(text: "test", url: "url")
let case2 = TestType(text: "test", url: "url")

print(case1 == case2)
