public protocol MusicRepository {
    func lookup(artistIds: [Identity], limit: Int?, callback: ((Result<[Track]>) -> Void))
}
