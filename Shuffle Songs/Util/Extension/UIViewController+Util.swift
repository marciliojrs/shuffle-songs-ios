import UIKit

extension UIViewController {
    func wrapIt(to navController: UINavigationController.Type) -> UINavigationController {
        return navController.init(rootViewController: self)
    }
}
