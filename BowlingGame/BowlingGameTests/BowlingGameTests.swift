import XCTest
@testable import BowlingGame

class BowlingGameTests: XCTestCase {

    private var bowling:Bowling!
    
    override func setUp() {
        bowling = Bowling()
    }
    func test_NumberOfFramesEqualsToTenForAGame() {
        
        XCTAssertEqual(bowling.numberOfFrames(), 10)
    }
    
    func test_NumberOfRollsForAFrame() {
        
        XCTAssertEqual(bowling.numberOfRolls(), 2)
    }

    func test_ScoreShouldReturnZero_WhenZeroPinsInSingleRoll() {
        
        XCTAssertEqual(bowling.getScore(pins:0), 0)
    }
}
