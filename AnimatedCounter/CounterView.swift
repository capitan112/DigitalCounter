//
//  CounterView.swift
//  AnimatedCounter
//
//  Created by Oleksiy Chebotarov on 25/09/2020.
//

import UIKit

enum ScrollingStyle: Int {
    case flick = 1
    case spring
}

class DigitView: UIView, UIScrollViewDelegate {
    private weak var scrollView: UIScrollView?
    private weak var digitsView: CounterContentView?
    private(set) var scrollStyle: ScrollingStyle?

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)

        scrollStyle = .flick
        addViews()
    }

    func addViews() {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 90)
        let scrollView = UIScrollView(frame: frame)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self

        let digitsView = CounterContentView()
        scrollView.addSubview(digitsView)
        self.digitsView = digitsView

        scrollView.contentSize = CGSize(width: 50, height: 900)
        addSubview(scrollView)
        self.scrollView = scrollView

        let height = frame.size.height
        let width = frame.size.width

        let whiteWithNoAlpha = UIColor(white: 1.0, alpha: 0.0)
        let whiteWithFullAlpha = UIColor(white: 1.0, alpha: 1.0)

        let colors = [whiteWithNoAlpha.cgColor, whiteWithFullAlpha.cgColor]

        let topPoint = CGPoint(x: 0.5, y: 1.0)
        let bottomPoint = CGPoint(x: 0.5, y: 0.0)

        let topGradientView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 22))

        let topGradient = CAGradientLayer()
        topGradient.frame = CGRect(x: 0, y: 0, width: width, height: 22)
        topGradient.colors = colors
        topGradient.startPoint = topPoint
        topGradient.endPoint = bottomPoint
        topGradientView.layer.insertSublayer(topGradient, at: 0)

        addSubview(topGradientView)

        let bottomGradientView = UIView(frame: CGRect(x: 0, y: height - 8, width: width, height: 8))

        let bottomGradient = CAGradientLayer()
        bottomGradient.frame = CGRect(x: 0, y: 0, width: width, height: 8)
        bottomGradient.colors = colors
        bottomGradient.startPoint = bottomPoint
        bottomGradient.endPoint = topPoint
        bottomGradientView.layer.insertSublayer(bottomGradient, at: 0)

        addSubview(bottomGradientView)
    }

    func scroll(toDigit digit: Int) {
        let offset = CGFloat(90.0 * Double(digit))

        if scrollStyle == .flick {
            UIView.animate(
                withDuration: 0.8,
                delay: 0,
                options: .curveEaseOut,
                animations: {
                    self.scrollView?.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
                }
            ) { _ in
                // nothing
            }
        } else if scrollStyle == .spring {
            UIView.animate(
                withDuration: 0.8,
                delay: 0,
                usingSpringWithDamping: 0.85,
                initialSpringVelocity: 0.5,
                options: .curveEaseIn,
                animations: {
                    self.scrollView?.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
                }
            ) { _ in
            }
        }
    }
}
