import UIKit

class BaseViewController<ViewType: UIView>: UIViewController, Controller {
    override func loadView() {
        self.view = ViewType()
    }

    var mainView: ViewType {
        if let view = self.view as? ViewType {
            return view
        } else {
            let view = ViewType()
            self.view = view
            return view
        }
    }
}
