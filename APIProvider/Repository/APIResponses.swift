struct LookupResponse: Decodable {
    let resultCount: Int
    let results: [WrappedType]
}
