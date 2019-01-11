import UIKit
import APIProvider

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private let useCaseFactory = UseCaseFactory(baseUrl: "https://us-central1-tw-exercicio-mobile.cloudfunctions.net")

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Appearance.install()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .primary

        window?.rootViewController = SplashController { [weak self, useCaseFactory] in
            let trackListController = TrackListController(
                getTracksUseCase: useCaseFactory.makeGetTracksByArtistListWithLimit()
            ).wrapIt(to: AppNavigationController.self)

            self?.changeRootViewController(to: trackListController, animated: true)
        }

        window?.makeKeyAndVisible()
        return true
    }

    private func changeRootViewController(to viewController: UIViewController, animated: Bool) {
        guard let window = window, animated == true else {
            self.window?.rootViewController = viewController
            return
        }

        let snapshot = window.snapshotView(afterScreenUpdates: true)!
        viewController.view.addSubview(snapshot)
        window.rootViewController = viewController

        UIView.animate(withDuration: 0.25, delay: 1, animations: {
            snapshot.alpha = 0
            snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        }, completion: { _ in
            snapshot.removeFromSuperview()
        })
    }
}
