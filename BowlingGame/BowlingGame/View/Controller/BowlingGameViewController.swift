import UIKit

class BowlingGameViewController : UIViewController {
    
    @IBOutlet private weak var lblPinsInput: UILabel!
    @IBOutlet private weak var lblInputText: UILabel!
    @IBOutlet private weak var midButtonsStackView: UIStackView!
    @IBOutlet private weak var topButtonsStackView: UIStackView!
    @IBOutlet private weak var bottomButtonsStackView: UIStackView!
    
    internal var score: Int = 0
    private let InputText      = "Input :"
    private let Empty          = ""
    private var bowlingPresenter:BowlingPresenter!
    private var tapped:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bowlingPresenter = BowlingPresenter(bowlingModel: BowlingModel())
    }

    @IBAction func btnAction(_ sender: UIButton) {
        bowlingPresenter.roll(pins: sender.tag)
        
        let pinsText = lblPinsInput.text ??  Empty
        lblPinsInput.text =  pinsText + String(sender.tag)
    }
    
    @IBAction func calculateScore(_ sender: UIButton) {
        let _ = bowlingPresenter.getScore()
    }
}
