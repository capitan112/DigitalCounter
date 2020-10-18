import UIKit

class ViewController: UIViewController {
    @IBOutlet var digitalCounterView: DigitalCounterView!

    override func viewDidLoad() {
        super.viewDidLoad()
        digitalCounterView.setUpInitialParameters(start: 396)
    }

    @IBAction func startButtonPressed(_: Any) {
        digitalCounterView.startTimer()
    }

    @IBAction func stopButtonPressed(_: Any) {
        digitalCounterView.stopTimer()
    }
}
