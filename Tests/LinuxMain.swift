#if os(Linux)

import XCTest
@testable import LogMiddlewareTestSuite

XCTMain([
    testCase(LogMiddlewareTests.allTests)
])

#endif
