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
    private var tapped:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bowlingPresenter = BowlingPresenter(bowlingView: self, bowlingModel: BowlingModel())
    }

    @IBAction func btnAction(_ sender: UIButton) {
        bowlingPresenter.roll(pins: sender.tag)
        enableRequiredButtons(sender)

        let pinsText = lblPinsInput.text ??  Empty
        lblPinsInput.text =  pinsText + String(sender.tag)
    }
    
    @IBAction func calculateScore(_ sender: UIButton) {
        let _ = bowlingPresenter.getScore()
    }
    
    private func enableRequiredButtons(_ sender: UIButton) {
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
        if (tapped) {
            enableAllRows()
        }
        if (sender.tag != 10) {
            tapped.toggle()
        }
    }
    
    func showScore() {
        
    }
}
