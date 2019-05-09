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
    
    private func evaluateScore(_ rollIndex: inout Int) {
        if (isSpare(rollIndex)) {
            self.bowlingModel.score += 10 + self.bowlingModel.rolls[rollIndex + 2]
            rollIndex += 2
        } else {
            self.bowlingModel.score += self.bowlingModel.rolls[rollIndex] + self.bowlingModel.rolls[rollIndex + 1]
            rollIndex += 2
        }
    }
    
    private func isSpare(_ rollIndex: Int) -> (Bool) {
        return (self.bowlingModel.rolls[rollIndex] + self.bowlingModel.rolls[rollIndex + 1] == 10)
    }
}
