public enum DomainError: Swift.Error {
    case underlying(Swift.Error)
}

public enum Result<Type> {
    case success(Type)
    case error(DomainError)
}
