import XCTest
@testable import BowlingGame

class BowlingGameTests: XCTestCase {

    func test_NumberOfFramesEqualsToTenForAGame() {
        let bowling = Bowling()
        
        XCTAssertEqual(bowling.numberOfFrames(), 10)
    }
}
