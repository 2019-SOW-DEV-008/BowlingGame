import XCTest
@testable import BowlingGame

class BowlingPresenterTests: XCTestCase {

    private var bowling:BowlingPresenter!
    private var bowlingView:SpyBowlingView!
    private var bowlingModel:BowlingModel!

    
    override func setUp() {
        bowlingView = SpyBowlingView()
        bowlingModel = BowlingModel()
        bowling = BowlingPresenter(bowlingView: bowlingView, bowlingModel: bowlingModel)
        
        super.setUp()
    }

    func test_ScoreShouldReturnZero_WhenZeroPins_InSingleRoll() {
        rollBall(times: 1, pins: 0)
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 0)
    }
    
    func test_ScoreShouldReturnValue_When_Nine_NumberOfPins_InSingleRoll() {
        rollBall(times: 1, pins: 9)
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 9)
    }

    func test_ScoreShouldReturnSix_When_OnePinInFirstRoll_AndFivePinsInSecondRoll() {
        rollBall(times: 1, pins: 1)
        rollBall(times: 1, pins: 5)
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 6)
    }
    
    func test_ScoreShouldReturnValue_When_DifferentNumberOfPins_InEverySingleRoll() {
        let TenIntegers = 1...10
        
        TenIntegers.forEach { pins in
            rollBall(times: 1, pins: pins)
        }
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 55)
    }
    
    func test_ScoreShouldReturnTwenty_When_PinsAreOneForTwentyRolls() {
        rollBall(times: 20, pins: 1)
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 20)
    }
    
    func test_ScoreShouldBeSumOfPins_When_PinsAreLessThanTenInTwoRolls() {
        rollBall(times: 1, pins: 5)
        rollBall(times: 1, pins: 4)
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 9)
    }
    
    func test_ScoreShouldBeSixteen_WhenItIsASpareFollowedByTwo() {
        rollSpare()
        rollBall(times: 1, pins: 2)
        rollBall(times: 1, pins: 2)
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 16)
    }
    
    func test_ScoreShouldReturnTwentySix_When_TwoSpares_WhereSpareIs_SixInFirstRollAndFourInSecondRoll() {
        rollSpare()
        rollSpare()
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 26)
    }
    
    func test_ScoreShouldReturnFourteen_When_StrikeFollowedByOneAndOne() {
        rollStrike()
        rollBall(times: 1, pins: 1)
        rollBall(times: 1, pins: 1)
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 14)
    }
    
    func test_ScoreShouldReturnThreeHundred_When_PerfectRoll_WhichIsAllStrikes() {
        rollBall(times: 12, pins: 10)
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 300)
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
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 147)
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
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 169)
    }
    
    func test_CheckIfSpareBonusBallAvailable_IfItIsSpareAtTenthFrame() {
        rollBall(times: 18, pins: 7)
        rollSpare()

        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 136)
        
        XCTAssertTrue(bowling.isSpareBonusAvailable)
    }

    func test_CheckIfStrikeBonusBallAvailable_IfItIsStrikeAtTenthFrame() {
        rollBall(times: 18, pins: 7)
        rollStrike()
        
        bowling.getScore()
        
        XCTAssertEqual(bowlingView.score, 136)
        
        XCTAssertTrue(bowling.isStrikeBonusAvailable)
    }
    
    func test_ShowScoreInformation_WhenCalculateIsTapped() {
        bowling.getScore()
        
        XCTAssertTrue(bowlingView.scoreInfoIsDisplayed)
    }
    
    func test_ShowZeroScore_WhenResetGameIsInitiated() {
        bowling.getScore()
        bowling.resetGame()
        
        XCTAssertEqual(bowlingView.score, 0)
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

class SpyBowlingView:BowlingView {
    var score: Int = 0
    
    var scoreInfoIsDisplayed = false
    
    func showScore() {
        scoreInfoIsDisplayed = true
    }
}
