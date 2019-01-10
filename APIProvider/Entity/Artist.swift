import Domain

struct Artist: Codable {
    let id: Int
    let name: String
    let primaryGenre: String
    let wrapperType: String

    enum CodingKeys: String, CodingKey {
        case id
        case wrapperType
        case primaryGenre = "primaryGenreName"
        case name = "artistName"
    }
}

extension Artist: DomainConvertibleType {
    typealias DomainType = Domain.Artist

    init(with domain: DomainType) {
        self.id = domain.id
        self.name = domain.name
        self.primaryGenre = domain.primaryGenre
        self.wrapperType = "artist"
    }

    func asDomain() -> Artist.DomainType {
        return Domain.Artist(
            id: id,
            name: name,
            primaryGenre: primaryGenre
        )
    }
}

