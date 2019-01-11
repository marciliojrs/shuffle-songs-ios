import Domain

class TrackListController: BaseViewController<TrackListView> {
    private let getTracksUseCase: GetTracksByArtistListWithLimitUseCaseType

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    init(getTracksUseCase: GetTracksByArtistListWithLimitUseCaseType) {
        self.getTracksUseCase = getTracksUseCase
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        getTracksUseCase.execute(artists: [909253]) { [mainView] (result) in
            switch result {
            case .success(let tracks): mainView.addTracks(tracks)
            default: break
            }
        }
    }
}
