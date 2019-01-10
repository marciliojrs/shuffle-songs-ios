public typealias GetTracksByArtistListWithLimitUseCaseResponse = ((Result<[Track]>) -> Void)

public protocol GetTracksByArtistListWithLimitUseCaseType {
    init(repository: MusicRepository)

    func execute(artists: [Identity], limit: Int, callback: @escaping GetTracksByArtistListWithLimitUseCaseResponse)
    func execute(artists: [Identity], callback: @escaping GetTracksByArtistListWithLimitUseCaseResponse)
}

public struct GetTracksByArtistListWithLimitUseCase: GetTracksByArtistListWithLimitUseCaseType {
    private let repository: MusicRepository

    public init(repository: MusicRepository) {
        self.repository = repository
    }

    public func execute(artists: [Identity], callback: @escaping GetTracksByArtistListWithLimitUseCaseResponse) {
        execute(artists: artists, limit: 5, callback: callback)
    }

    public func execute(artists: [Identity],
                        limit: Int,
                        callback: @escaping GetTracksByArtistListWithLimitUseCaseResponse) {
        repository.lookup(artistIds: artists, limit: limit, callback: callback)
    }
}
