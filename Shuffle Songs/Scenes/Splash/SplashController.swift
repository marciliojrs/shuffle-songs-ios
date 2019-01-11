import Foundation
import UIKit

final class SplashController: BaseViewController<SplashView>, SplashViewActionDelegate {
    private let shouldDimiss: () -> Void

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    init(shouldDismiss: @escaping (() -> Void)) {
        self.shouldDimiss = shouldDismiss
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.actionDelegate = self
        mainView.animateAppear()
    }

    func splashViewfinishAnimation() {
        shouldDimiss()
    }
}
