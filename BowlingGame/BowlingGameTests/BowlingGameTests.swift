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

    func test_ScoreShouldReturnZero_WhenZeroPins_InSingleRoll() {
        
        XCTAssertEqual(bowling.getScore(pins:0), 0)
    }
    
    func test_ScoreShouldReturnValue_When_N_NumberOfPins_InSingleRoll() {
        let numberOfPins = 9
        
        XCTAssertEqual(bowling.getScore(pins:9), numberOfPins)
    }
    
    func test_ScoreShouldReturnValue_When_TenNumberOfPins_InEverySingleRoll() {
        let TenIntegers = 1...10
        
        TenIntegers.forEach { pins in
            XCTAssertEqual(bowling.getScore(pins:pins), pins)
        }
        
    }
}
