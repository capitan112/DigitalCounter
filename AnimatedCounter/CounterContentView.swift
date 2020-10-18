//
//  CounterView.swift
//  AnimatedCounter
//
//  Created by Oleksiy Chebotarov on 25/09/2020.
//

import UIKit

class DigitContentView: UIView {
    override func draw(_: CGRect) {
        let paragraphStyle = NSMutableParagraphStyle.default as? NSMutableParagraphStyle
        paragraphStyle?.alignment = .center

        var fontAttributes = [NSAttributedString.Key: Any]()
        if let font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 80),
            let paragraphStyle = paragraphStyle
        {
            fontAttributes = [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
            ]
        }

        "0".draw(in: CGRect(x: 0, y: 90 * 0, width: 50, height: 90), withAttributes: fontAttributes)
        "1".draw(in: CGRect(x: 0, y: 90 * 1, width: 50, height: 90), withAttributes: fontAttributes)
        "2".draw(in: CGRect(x: 0, y: 90 * 2, width: 50, height: 90), withAttributes: fontAttributes)
        "3".draw(in: CGRect(x: 0, y: 90 * 3, width: 50, height: 90), withAttributes: fontAttributes)
        "4".draw(in: CGRect(x: 0, y: 90 * 4, width: 50, height: 90), withAttributes: fontAttributes)
        "5".draw(in: CGRect(x: 0, y: 90 * 5, width: 50, height: 90), withAttributes: fontAttributes)
        "6".draw(in: CGRect(x: 0, y: 90 * 6, width: 50, height: 90), withAttributes: fontAttributes)
        "7".draw(in: CGRect(x: 0, y: 90 * 7, width: 50, height: 90), withAttributes: fontAttributes)
        "8".draw(in: CGRect(x: 0, y: 90 * 8, width: 50, height: 90), withAttributes: fontAttributes)
        "9".draw(in: CGRect(x: 0, y: 90 * 9, width: 50, height: 90), withAttributes: fontAttributes)
    }

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
}
