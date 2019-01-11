public struct Track: Equatable, Hashable {
    public let id: Identity
    public let artistName: String
    public let name: String
    public let artwork: URL
    public let primaryGenre: String

    public init(id: Identity, artistName: String, name: String, artwork: URL, primaryGenre: String) {
        self.id = id
        self.artistName = artistName
        self.name = name
        self.artwork = artwork
        self.primaryGenre = primaryGenre
    }
}

extension Track: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "\(name)-\(artistName)"
    }
}
