public protocol UseCaseFactory: class {
    func makeGetTracksByArtistListWithLimit() -> GetTracksByArtistListWithLimitUseCaseType
    func makeShuffle() -> ShuffleSongsUseCaseType
}
