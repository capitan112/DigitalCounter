import UIKit

class DigitContentView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 900.0)
        backgroundColor = UIColor.white
    }

    override func draw(_: CGRect) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        var fontAttributes = [NSAttributedString.Key: Any]()
        if let font = UIFont(name: "HelveticaNeue-Bold", size: 80) {
            fontAttributes = [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
            ]
        }

        for index in stride(from: 0, through: 10, by: 1) {
            if index == 10 {
                String(0).draw(in: CGRect(x: 0, y: 90 * index, width: 50, height: 90), withAttributes: fontAttributes)
            } else {
                String(index).draw(in: CGRect(x: 0, y: 90 * index, width: 50, height: 90), withAttributes: fontAttributes)
            }
        }
    }
}
