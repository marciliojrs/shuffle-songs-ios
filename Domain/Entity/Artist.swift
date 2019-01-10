public struct Artist: Equatable {
    public let id: Identity
    public let name: String
    public let primaryGenre: String

    public init(id: Identity, name: String, primaryGenre: String) {
        self.id = id
        self.name = name
        self.primaryGenre = primaryGenre
    }
}
