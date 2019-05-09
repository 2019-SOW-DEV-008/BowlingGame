import XCTest
@testable import BowlingGame

class BowlingGameTests: XCTestCase {

    func test_NumberOfFramesEqualsToTenForAGame() {
        let bowling = Bowling()
        
        XCTAssertEqual(bowling.numberOfFrames(), 10)
    }
    
    func test_NumberOfRollsForAFrame() {
        let bowling = Bowling()
        
        XCTAssertEqual(bowling.numberOfRolls(), 2)
    }
}
