import XCTest
@testable import BowlingGame

class BowlingGameTests: XCTestCase {

    private var bowling:Bowling!
    
    override func setUp() {
        bowling = Bowling(bowlingModel: BowlingModel())
    }
    
    func test_NumberOfFramesEqualsToTenForAGame() {
        
        XCTAssertEqual(bowling.numberOfFrames(), 10)
    }
    
    func test_NumberOfRollsForAFrame() {
        
        XCTAssertEqual(bowling.numberOfRolls(), 2)
    }

    func test_ScoreShouldReturnZero_WhenZeroPins_InSingleRoll() {
        bowling.roll(pins: 0)
        
        XCTAssertEqual(bowling.getScore(), 0)
    }
    
    func test_ScoreShouldReturnValue_When_Nine_NumberOfPins_InSingleRoll() {
        bowling.roll(pins: 9)
        
        XCTAssertEqual(bowling.getScore(), 9)
    }

    func test_ScoreShouldReturnSix_When_OnePinInFirstRoll_AndFivePinsInSecondRoll() {
        bowling.roll(pins: 1)
        bowling.roll(pins: 5)
        
        XCTAssertEqual(bowling.getScore(), 6)
    }
    
    func test_ScoreShouldReturnValue_When_DifferentNumberOfPins_InEverySingleRoll() {
        let TenIntegers = 1...10
        
        TenIntegers.forEach { pins in
            bowling.roll(pins: pins)
        }
        XCTAssertEqual(bowling.getScore(), 55)
    }
}
