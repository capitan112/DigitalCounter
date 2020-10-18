import Foundation
import UIKit

class DigitalCounterView: UIView {
    @IBOutlet var onesDigitView: DigitView!
    @IBOutlet var tensDigitView: DigitView!
    @IBOutlet var hundredsDigitView: DigitView!
    private var timer: Timer?
    private var counter: Int = 0

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        guard let xibView = Bundle.main.loadNibNamed(String(describing: Self.self),
                                                     owner: self,
                                                     options: nil)?.first as? UIView
        else { return assertionFailure("Should find (#file)") }
        subviews.forEach { $0.removeFromSuperview() }
        addSubview(xibView)
        xibView.frame = bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    func setUpInitialParameters(start: Int) {
        counter = start

        let onesDigit = counter % 10
        let tensDigit = counter / 10 % 10
        let hundredsDigit = counter / 100 % 10

        onesDigitView.setUp(toDigit: onesDigit)
        tensDigitView.setUp(toDigit: tensDigit)
        hundredsDigitView.setUp(toDigit: hundredsDigit)
    }

    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DigitalCounterView.animateDigits), userInfo: nil, repeats: true)
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    @objc private func animateDigits() {
        counter += 1
        let onesDigit = counter % 10
        let tensDigit = counter / 10 % 10
        let hundredsDigit = counter / 100 % 10

        onesDigitView.scroll(toDigit: onesDigit)
        tensDigitView.scroll(toDigit: tensDigit)
        hundredsDigitView.scroll(toDigit: hundredsDigit)
    }
}
