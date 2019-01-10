import Domain

class UseCaseFactory: Domain.UseCaseFactory {
    private let network: NetworkService
    init(baseUrl: String) {
        self.network = NetworkService(baseUrl: baseUrl)
    }

    func makeGetTracksByArtistListWithLimit() -> GetTracksByArtistListWithLimitUseCaseType {
        return GetTracksByArtistListWithLimitUseCase(repository: MusicRepository(network: network))
    }
}
