enum WrappedType: Decodable {
    enum CodingKeys: String, CodingKey {
        case wrapperType
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .wrapperType)
        if type == "artist" {
            self = .artist(try Artist(from: decoder))
        } else {
            self = .track(try Track(from: decoder))
        }
    }

    case artist(Artist)
    case track(Track)

    func isTrack() -> Bool {
        switch self {
        case .track: return true
        default: return false
        }
    }
}
