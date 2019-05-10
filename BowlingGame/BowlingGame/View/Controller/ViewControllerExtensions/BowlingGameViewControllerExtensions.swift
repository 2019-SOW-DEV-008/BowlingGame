import UIKit

extension BowlingGameViewController {
    func disableLastRow() {
        bottomButtonsStackView.alpha = 0.4
        bottomButtonsStackView.isUserInteractionEnabled = false
    }
    
    func disableMidRow() {
        midButtonsStackView.alpha = 0.4
        midButtonsStackView.isUserInteractionEnabled = false
    }
    
    func iterateMidRowToEnable(_ tag:Int) {
        midButtonsStackView.subviews.forEach({ (view) in
            enableOrDisableView(view, tag)
        })
    }
    
    func iterateFirstRowToEnable(_ tag:Int) {
        topButtonsStackView.subviews.forEach({ (view) in
            enableOrDisableView(view, tag)
        })
    }
    
    func enableFirstRow() {
        topButtonsStackView.isUserInteractionEnabled=true
        topButtonsStackView.subviews.forEach { (view) in
            view.isUserInteractionEnabled = true
            view.alpha = 1.0
        }
        topButtonsStackView.alpha = 1.0
    }
    func enableMidRow() {
        midButtonsStackView.isUserInteractionEnabled=true
        midButtonsStackView.subviews.forEach { (view) in
            view.isUserInteractionEnabled = true
            view.alpha = 1.0
        }
        midButtonsStackView.alpha = 1.0
    }
    
    func enableLastRow() {
        bottomButtonsStackView.isUserInteractionEnabled = true
        bottomButtonsStackView.subviews.forEach { (view) in
            view.isUserInteractionEnabled = true
            view.alpha = 1.0
        }
        bottomButtonsStackView.alpha=1.0
    }
    
    func enableAllRows() {
        enableFirstRow()
        enableMidRow()
        enableLastRow()
    }
    
    private func enableOrDisableView(_ view: UIView, _ tag:Int) {
        view.alpha = (view.tag > (10 - tag)) ? 0.4 : 1.0
        view.isUserInteractionEnabled = (view.tag > (10 - tag)) ? false : true
    }
}
