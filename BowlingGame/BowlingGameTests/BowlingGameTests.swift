import XCTest
@testable import BowlingGame

class BowlingGameTests: XCTestCase {

    private var bowling:Bowling!
    
    override func setUp() {
        bowling = Bowling(bowlingModel: BowlingModel())
    }
    
    func test_NumberOfRollsForAFrame() {
        
        XCTAssertEqual(bowling.numberOfRolls(), 2)
    }

    func test_ScoreShouldReturnZero_WhenZeroPins_InSingleRoll() {
        rollBall(times: 1, pins: 0)
        
        XCTAssertEqual(bowling.getScore(), 0)
    }
    
    func test_ScoreShouldReturnValue_When_Nine_NumberOfPins_InSingleRoll() {
        rollBall(times: 1, pins: 9)
        
        XCTAssertEqual(bowling.getScore(), 9)
    }

    func test_ScoreShouldReturnSix_When_OnePinInFirstRoll_AndFivePinsInSecondRoll() {
        rollBall(times: 1, pins: 1)
        rollBall(times: 1, pins: 5)
        
        XCTAssertEqual(bowling.getScore(), 6)
    }
    
    func test_ScoreShouldReturnValue_When_DifferentNumberOfPins_InEverySingleRoll() {
        let TenIntegers = 1...10
        
        TenIntegers.forEach { pins in
            rollBall(times: 1, pins: pins)
        }
        
        XCTAssertEqual(bowling.getScore(), 55)
    }
    
    func test_ScoreShouldReturnTwenty_When_PinsAreOneForTwentyRolls() {
        rollBall(times: 20, pins: 1)
        
        XCTAssertEqual(bowling.getScore(), 20)
    }
    
    func test_ScoreShouldBeSumOfPins_When_PinsAreLessThanTenInTwoRolls() {
        rollBall(times: 1, pins: 5)
        rollBall(times: 1, pins: 4)
        
        XCTAssertEqual(bowling.getScore(), 9)
    }
    
    func test_ScoreShouldBeFourteen_WhenItIsASpareFollowedByTwo() {
        rollSpare()
        rollBall(times: 1, pins: 2)
        rollBall(times: 1, pins: 2)
        
        XCTAssertEqual(bowling.getScore(), 14)
    }
    
    private func rollBall(times:Int, pins:Int) {

        for _ in 1...times {
            bowling.roll(pins: pins)
        }
    }
    
    private func rollSpare() {
        rollBall(times: 1, pins: 4)
        rollBall(times: 1, pins: 6)
    }
}
