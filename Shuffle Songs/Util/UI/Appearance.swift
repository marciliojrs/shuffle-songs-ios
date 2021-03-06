import UIKit

struct Appearance {
    private init() {}

    static func install() {
        setUpNavigationAppearance()
    }

    static private func setUpNavigationAppearance() {
        let navBar = UINavigationBar.appearance(whenContainedInInstancesOf: [AppNavigationController.self])

        navBar.barTintColor = .primary
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBar.tintColor = .white
        navBar.isTranslucent = true
        navBar.prefersLargeTitles = false
    }
}

extension UIColor {
    static var primary: UIColor { return UIColor(red: 55/255, green: 38/255, blue: 55/255, alpha: 1) }
    static var secondary: UIColor { return UIColor(red: 192/255, green: 94/255, blue: 108/255, alpha: 1) }
}
