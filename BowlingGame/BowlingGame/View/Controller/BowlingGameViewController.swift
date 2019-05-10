import UIKit

class BowlingGameViewController : UIViewController, BowlingView {
    
    @IBOutlet private weak var lblPinsInput: UILabel!
    @IBOutlet private weak var lblInputText: UILabel!
    @IBOutlet weak var midButtonsStackView: UIStackView!
    @IBOutlet weak var topButtonsStackView: UIStackView!
    @IBOutlet weak var bottomButtonsStackView: UIStackView!
    
    internal var score: Int = 0
    private let InputText      = "Input :"
    private let Empty          = ""
    private var bowlingPresenter:BowlingPresenter!
    private var isEligibleToEnableAllRows:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bowlingPresenter = BowlingPresenter(bowlingView: self, bowlingModel: BowlingModel())
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        bowlingPresenter.roll(pins: sender.tag)
        enableOrDisableButtons(sender)
        displayPinsInput(sender)
    }
    
    @IBAction func calculateScore(_ sender: UIButton) {
        bowlingPresenter.getScore()
    }
    
    // Protocols
    func showScore() {
        let alert = UIAlertController(title: "Score Is", message: String(self.score), preferredStyle: .alert)
        alert.view.accessibilityIdentifier = "Alert"
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { Void in
            self.lblPinsInput.text = self.Empty
            self.bowlingPresenter.resetGame()
            self.enableAllRows()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func enableRequiredButtons(_ sender: UIButton) {
        enableButtonsOnCondition(sender)
        if (isEligibleToEnableAllRows) {
            enableAllRows()
        }
        if (sender.tag != 10) {
            isEligibleToEnableAllRows.toggle()
        }
    }
    
    private func displayPinsInput(_ sender: UIButton) {
        let pinsText = lblPinsInput.text ??  Empty
        lblPinsInput.text =  pinsText + getXforStrike(tag:sender.tag)
    }
    
    private func getXforStrike(tag: Int) -> String {
        return (tag == 10) ? "X" : String(tag)
    }
    
    private func enableOrDisableButtons(_ sender: UIButton) {
        if (sender.tag != 0 || sender.tag != 10) {
            enableRequiredButtons(sender)
        }
    }
    
    private func enableButtonsOnCondition(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            disableLastRow()
        case 2,3,4,5,6:
            iterateMidRowToEnable(sender.tag)
            disableLastRow()
        case 7,8,9:
            iterateFirstRowToEnable(sender.tag)
            disableMidRow()
            disableLastRow()
        default:
            break
        }
    }
}
