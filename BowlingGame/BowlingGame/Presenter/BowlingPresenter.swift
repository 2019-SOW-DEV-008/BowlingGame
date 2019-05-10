class BowlingPresenter {
    
    private var bowlingModel:BowlingModel!
    private var bowlingView:BowlingView!

    private var currentIndex = 0
    private let numberOfFrames = 10
    private let numberOfRolls = 21
    
    var isSpareBonusAvailable = false
    var isStrikeBonusAvailable = false
    
    init(bowlingView: BowlingView, bowlingModel: BowlingModel) {
        self.bowlingModel = bowlingModel
        self.bowlingView = bowlingView
    }
    
    func roll(pins:Int) {
        self.bowlingModel.rolls[currentIndex] = pins
        currentIndex += 1
    }
    
    func getScore() {
        var rollIndex = 0
        let frames = 1...numberOfFrames
        
        frames.forEach {_ in
            evaluateScore(&rollIndex)
        }
        
        bowlingView.score = self.bowlingModel.score
        bowlingView.showScore()
    }
    
    func resetGame() {
        currentIndex = 0
        self.bowlingModel.score = 0
    }
}

private extension BowlingPresenter {
    
    func evaluateScore(_ rollIndex: inout Int) {
        if (isStrike(rollIndex)) {
            checkIfStrikeBonusAvailable(rollIndex)
            updateScoreInStrikeBonus(rollIndex)
            rollIndex += 1
        }
        else if (isSpare(rollIndex)) {
            checkIfSpareBonusAvailable(rollIndex)
            updateScoreInSpareBonus(rollIndex)
            rollIndex += 2
        } else {
            updateScore(rollIndex)
            rollIndex += 2
        }
    }
    
    func updateScoreInStrikeBonus(_ rollIndex: Int) {
        self.bowlingModel.score += getStikeScore(rollIndex)
    }
    
    func updateScoreInSpareBonus(_ rollIndex: Int) {
        self.bowlingModel.score += getSpareScore(rollIndex)
    }
    
    func updateScore(_ rollIndex: Int) {
        self.bowlingModel.score += getFrameScore(rollIndex)
    }
    
    func isStrike(_ rollIndex: Int) -> (Bool) {
        return (self.bowlingModel.rolls[rollIndex] == 10)
    }
    
    func isSpare(_ rollIndex: Int) -> (Bool) {
        return (self.bowlingModel.rolls[rollIndex] + self.bowlingModel.rolls[rollIndex + 1] == 10)
    }
    
    func getStikeScore(_ rollIndex: Int) -> Int {
        return 10 + self.bowlingModel.rolls[rollIndex+1] + self.bowlingModel.rolls[rollIndex + 2]
    }
    
    func getSpareScore(_ rollIndex: Int) -> Int {
        return 10 + self.bowlingModel.rolls[rollIndex + 2]
    }
    
    func getFrameScore(_ rollIndex: Int) -> Int {
        return self.bowlingModel.rolls[rollIndex] + self.bowlingModel.rolls[rollIndex + 1]
    }
    
    func checkIfStrikeBonusAvailable(_ rollIndex: Int) {
        if (rollIndex == (numberOfRolls - 3)) {
            isStrikeBonusAvailable = true
        }
    }
    
    func checkIfSpareBonusAvailable(_ rollIndex: Int) {
        if (rollIndex == (numberOfRolls - 3)) {
            isSpareBonusAvailable = true
        }
    }
}
