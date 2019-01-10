public protocol UseCaseFactory: class {
    func makeGetTracksByArtistListWithLimit() -> GetTracksByArtistListWithLimitUseCaseType
}
