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
        window?.rootViewController = TrackListController(
            getTracksUseCase: useCaseFactory.makeGetTracksByArtistListWithLimit()
        ).wrapIt(to: AppNavigationController.self)

        window?.makeKeyAndVisible()
        return true
    }
}
