import Domain

class MusicRepositoryMock: MusicRepository {
    var lookupCalled: Bool = false
    var lookupArtistIdsParam: [Identity]?
    var lookupLimitParam: Int?
    var lookupResponse: Result<[Track]>?

    func lookup(artistIds: [Identity], limit: Int?, callback: @escaping ((Result<[Track]>) -> Void)) {
        lookupCalled = true
        lookupArtistIdsParam = artistIds
        lookupLimitParam = limit

        if let lookupResponse = lookupResponse {
            callback(lookupResponse)
        }
    }
}
