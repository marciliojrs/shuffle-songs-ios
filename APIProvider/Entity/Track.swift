import Domain

struct Track: Codable {
    let wrapperType: String
    let id: Int
    let artistName: String
    let name: String
    let artwork: URL

    enum CodingKeys: String, CodingKey {
        case id
        case wrapperType
        case artistName
        case name = "trackName"
        case artwork = "artworkUrl"
    }
}

extension Track: DomainConvertibleType {
    typealias DomainType = Domain.Track

    init(with domain: DomainType) {
        self.id = domain.id
        self.name = domain.name
        self.artistName = domain.artistName
        self.artwork = domain.artwork
        self.wrapperType = "track"
    }

    func asDomain() -> Track.DomainType {
        return Domain.Track(
            id: id,
            artistName: artistName,
            name: name,
            artwork: artwork
        )
    }
}
