import UIKit

class DigitView: UIView, UIScrollViewDelegate {
    private(set) weak var scrollView: UIScrollView?
    private weak var digitsView: DigitContentView?
    private let nineNumberOffset: CGFloat = 810.0

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        addViews()
    }

    private func addViews() {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 90)
        let scrollView = UIScrollView(frame: frame)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self

        let digitsView = DigitContentView()
        scrollView.addSubview(digitsView)
        self.digitsView = digitsView

        scrollView.contentSize = CGSize(width: 50, height: 990)
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

    private func animateScrollView(with offset: CGFloat) {
        UIView.animate(
            withDuration: 0.6,
            delay: 0.0,
            usingSpringWithDamping: 0.85,
            initialSpringVelocity: 1.5,
            options: .curveEaseIn,
            animations: {
                self.scrollView?.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
            }
        )
    }

    func setUp(toDigit digit: Int) {
        let offset: CGFloat = 90.0 * CGFloat(digit)
        scrollView?.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
    }

    func scroll(toDigit digit: Int) {
        let offsetToNumber: CGFloat = 90.0 * CGFloat(digit)
        
        guard let yContentOffset = scrollView?.contentOffset.y else { return }

        if offsetToNumber == 0, yContentOffset >= nineNumberOffset {
            let offsetToTenDigit: CGFloat = 90.0 * CGFloat(10)
            animateScrollView(with: offsetToTenDigit)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.scrollView?.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            }
        } else {
            animateScrollView(with: offsetToNumber)
        }
    }
}
