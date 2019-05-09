class Bowling {
    
    private var bowlingModel:BowlingModel!

    private var currentIndex = 0
    
    init(bowlingModel:BowlingModel) {
        self.bowlingModel = bowlingModel
    }
    
    func numberOfFrames() -> Int {
        return 10
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

        evaluateScore(&rollIndex)
        return self.bowlingModel.score
    }
    
    private func evaluateScore(_ rollIndex: inout Int) {
        for _ in self.bowlingModel.rolls {
            self.bowlingModel.score += self.bowlingModel.rolls[rollIndex]
            rollIndex += 1
        }
    }
}
