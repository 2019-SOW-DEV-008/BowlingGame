class Bowling {
    
    private var bowlingModel:BowlingModel!
    
    private var currentIndex = 0
    private let numberOfFrames = 10
    
    init(bowlingModel:BowlingModel) {
        self.bowlingModel = bowlingModel
    }
    
    func numberOfRolls() -> Int {
        return 2
    }
    
    func roll(pins:Int) {
        self.bowlingModel.rolls[currentIndex] = pins
        currentIndex += 1
    }
    
    func getScore() -> Int {
        var rollIndex = 0
        let frames = 1...numberOfFrames
        
        frames.forEach {_ in
            evaluateScore(&rollIndex)
        }
        
        return self.bowlingModel.score
    }
}

private extension Bowling {
    
    func evaluateScore(_ rollIndex: inout Int) {
        if (isStrike(rollIndex)) {
            updateScoreInStrikeBonus(rollIndex)
            rollIndex += 1
        }
        else if (isSpare(rollIndex)) {
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
        self.bowlingModel.score += getScore(rollIndex)
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
    
    func getScore(_ rollIndex: Int) -> Int {
        return self.bowlingModel.rolls[rollIndex] + self.bowlingModel.rolls[rollIndex + 1]
    }
}
