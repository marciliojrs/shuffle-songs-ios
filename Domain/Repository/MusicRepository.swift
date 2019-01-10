public protocol MusicRepository {
    func lookup(artistIds: [Identity], limit: Int?, callback: @escaping ((Result<[Track]>) -> Void))
}
