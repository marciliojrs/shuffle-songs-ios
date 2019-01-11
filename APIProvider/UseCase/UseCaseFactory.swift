import Domain

public class UseCaseFactory: Domain.UseCaseFactory {
    private let network: NetworkService
    public init(baseUrl: String) {
        self.network = NetworkService(baseUrl: baseUrl)
    }

    public func makeGetTracksByArtistListWithLimit() -> GetTracksByArtistListWithLimitUseCaseType {
        return GetTracksByArtistListWithLimitUseCase(repository: MusicRepository(network: network))
    }
}
