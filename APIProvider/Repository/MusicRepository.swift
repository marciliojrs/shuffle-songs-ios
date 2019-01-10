import Domain

struct MusicRepository: Domain.MusicRepository {
    private let networkService: NetworkService
    init(network: NetworkService) {
        self.networkService = network
    }

    func lookup(artistIds: [Identity], limit: Int?, callback: (@escaping (Result<[Domain.Track]>) -> Void)) {
        let ids = artistIds.map { "\($0)" }.joined(separator: ",")
        let resource = Resource(path: "lookup/", method: .get, queryItems: ["id": ids])
        try? networkService.callApi(resource: resource) { (result) in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(LookupResponse.self, from: data)
                    let wrappedTracks = response.results.filter { $0.isTrack() }
                    let tracks = wrappedTracks.map { trackWrapped -> Domain.Track? in
                        switch trackWrapped {
                        case .track(let track): return track.asDomain()
                        default: return nil
                        }
                    }.compactMap { $0 }

                    callback(.success(tracks))
                } catch {
                    callback(.error(DomainError.underlying(error)))
                }

                return
            case .failure(let error):
                callback(.error(DomainError.underlying(error)))
                return
            }
        }
    }
}
