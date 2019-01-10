public protocol GetTracksByArtistListWithLimitUseCaseType {
    init(repository: MusicRepository)
}

public struct GetTracksByArtistListWithLimitUseCase: GetTracksByArtistListWithLimitUseCaseType {
    private let repository: MusicRepository

    public init(repository: MusicRepository) {
        self.repository = repository
    }
}
