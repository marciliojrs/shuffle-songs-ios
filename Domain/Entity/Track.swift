public struct Track: Equatable {
    public let id: Identity
    public let artistName: String
    public let name: String
    public let artwork: URL

    public init(id: Identity, artistName: String, name: String, artwork: URL) {
        self.id = id
        self.artistName = artistName
        self.name = name
        self.artwork = artwork
    }
}
