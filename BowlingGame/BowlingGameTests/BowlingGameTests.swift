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
    
    func test_ScoreShouldBeSixteen_WhenItIsASpareFollowedByTwo() {
        rollSpare()
        rollBall(times: 1, pins: 2)
        rollBall(times: 1, pins: 2)
        
        XCTAssertEqual(bowling.getScore(), 16)
    }
    
    func test_ScoreShouldReturnTwentySix_When_TwoSpares_WhereSpareIs_SixInFirstRollAndFourInSecondRoll() {
        rollSpare()
        rollSpare()
        
        XCTAssertEqual(bowling.getScore(), 26)
    }
    
    func test_ScoreShouldReturnFourteen_When_StrikeFollowedByOneAndOne() {
        rollStrike()
        rollBall(times: 1, pins: 1)
        rollBall(times: 1, pins: 1)
        
        XCTAssertEqual(bowling.getScore(), 14)
    }
    
    func test_ScoreShouldReturnThreeHundred_When_PerfectRoll_WhichIsAllStrikes() {
        rollBall(times: 12, pins: 10)
        
        XCTAssertEqual(bowling.getScore(), 300)
    }
    
    func test_EvaluateScore_WithMultipleInput() {
        rollBall(times: 1, pins: 0)
        rollBall(times: 1, pins: 10)
        rollBall(times: 1, pins: 9)
        rollBall(times: 1, pins: 1)
        rollBall(times: 1, pins: 5)
        rollBall(times: 1, pins: 5)
        rollBall(times: 1, pins: 7)
        rollBall(times: 1, pins: 2)
        rollBall(times: 1, pins: 0)
        rollBall(times: 1, pins: 10)
        rollBall(times: 1, pins: 0)
        rollBall(times: 1, pins: 10)
        rollBall(times: 1, pins: 0)
        rollBall(times: 1, pins: 10)
        rollBall(times: 1, pins: 9)
        rollBall(times: 1, pins: 0)
        rollBall(times: 1, pins: 8)
        rollBall(times: 1, pins: 2)
        rollBall(times: 1, pins: 9)
        rollBall(times: 1, pins: 1)
        rollBall(times: 1, pins: 10)
        
        XCTAssertEqual(bowling.getScore(), 147)
    }
    
    func test_EvaluateScore_WithMultipleInputValues() {
        rollBall(times: 1, pins: 7)
        rollBall(times: 1, pins: 1)
        rollBall(times: 1, pins: 3)
        rollBall(times: 1, pins: 5)
        rollBall(times: 1, pins: 9)
        rollBall(times: 1, pins: 1)
        rollBall(times: 1, pins: 10)
        rollBall(times: 1, pins: 6)
        rollBall(times: 1, pins: 3)
        rollBall(times: 1, pins: 10)
        rollBall(times: 1, pins: 10)
        rollBall(times: 1, pins: 6)
        rollBall(times: 1, pins: 4)
        rollBall(times: 1, pins: 9)
        rollBall(times: 1, pins: 1)
        rollBall(times: 1, pins: 10)
        rollBall(times: 1, pins: 9)
        rollBall(times: 1, pins: 1)
        
        XCTAssertEqual(bowling.getScore(), 169)
    }
    

    private func rollBall(times:Int, pins:Int) {

        for _ in 1...times {
            bowling.roll(pins: pins)
        }
    }
    
    private func rollSpare() {
        rollBall(times: 1, pins: 6)
        rollBall(times: 1, pins: 4)
    }
    
    private func rollStrike() {
        rollBall(times: 1, pins: 10)
    }
}
