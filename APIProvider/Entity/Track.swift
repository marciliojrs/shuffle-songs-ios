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

extension Track {
    func asDomain() -> Domain.Track {
        return Domain.Track(id: id, artistName: artistName, name: name, artwork: artwork)
    }
}
