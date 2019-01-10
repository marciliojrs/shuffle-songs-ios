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
