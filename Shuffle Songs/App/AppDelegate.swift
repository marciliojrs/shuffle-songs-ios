import UIKit
import APIProvider

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private let useCaseFactory = UseCaseFactory(baseUrl: "https://us-central1-tw-exercicio-mobile.cloudfunctions.net")

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = TrackListController(
            getTracksUseCase: useCaseFactory.makeGetTracksByArtistListWithLimit()
        )
        window?.makeKeyAndVisible()
        return true
    }
}
