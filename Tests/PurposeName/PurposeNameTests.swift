@testable import PurposeName
import XCTest

class PurposeNameTests: XCTestCase {
    func testNoSuffix() {
        let result = AAMain.purposeName("README")
        XCTAssertEqual(result, "README.md")
    }

    func testJPGSuffix() {
        let result = AAMain.purposeName("beach", ofType: "JPG")
        XCTAssertEqual(result, "beach.JPG")
    }

    func testPNGSuffixWithExtraPeriod() {
        let result = AAMain.purposeName("stars", ofType: ".PNG")
        XCTAssertEqual(result, "stars.PNG")
    }

    func testWhitespace() {
        let result = AAMain.purposeName("stars are aligned")
        XCTAssertEqual(result, "stars-are-aligned.md")
    }

    func testSuffixArgumentIsUsed() {
      let input = ["processName", "1", "--suffix txt"]
      let result = AAMain.purposeName(input)
      XCTAssertEqual(result, "1.txt")
    }
}

#if os(Linux)
extension PurposeNameTests: XCTestCaseProvider {
  var allTests : [(String, () throws -> Void)] {
    return [
      ("testNoSuffix", testNoSuffix),
      ("testJPGSuffix", testJPGSuffix),
      ("testPNGSuffixWithExtraPeriod", testPNGSuffixWithExtraPeriod),
      ("testWhitespace", testWhitespace),
      ("testSuffixArgumentIsUsed", testSuffixArgumentIsUsed),
      ]
  }
}
#endif
