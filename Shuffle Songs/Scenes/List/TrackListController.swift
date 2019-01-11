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

        setupNavigation()
        fetchTracks()
    }

    private func setupNavigation() {
        navigationItem.title = "Shuffle Songs"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "shuffle"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(shuffleTracks))
    }

    private func fetchTracks() {
        mainView.setLoading(true)
        let chosenArtists = [909253, 1171421960, 358714030, 1419227, 264111789]
        getTracksUseCase.execute(artists: chosenArtists) { [mainView] (result) in
            mainView.setLoading(false)
            switch result {
            case .success(let tracks): mainView.addTracks(tracks)
            default: break
            }
        }
    }

    @objc func shuffleTracks() {

    }
}
