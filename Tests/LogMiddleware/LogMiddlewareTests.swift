import XCTest
@testable import LogMiddleware

class LogMiddlewareTests: XCTestCase {
    func testReality() {
        XCTAssert(2 + 2 == 4, "Something is severely wrong here.")
    }
}

extension LogMiddlewareTests {
    static var allTests: [(String, LogMiddlewareTests -> () throws -> Void)] {
        return [
           ("testReality", testReality),
        ]
    }
}
