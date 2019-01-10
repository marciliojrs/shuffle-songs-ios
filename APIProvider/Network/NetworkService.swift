import Foundation

struct Resource {
    let path: String
    let method: HTTPMethod
    let queryItems: [String: String]?
}

enum HTTPMethod: String {
    case get = "GET"
}

enum NetworkError: Error {
    case invalidUrl
    case noHttpResponse
    case noData
    case httpError(code: Int)
}

enum APIResult {
    case success(Data)
    case failure(NetworkError)
}

typealias NetworkServiceResponse = ((APIResult) -> Void)

struct NetworkService {
    private let baseUrl: String
    private let session: URLSession

    init(baseUrl: String, session: URLSession = URLSession.shared) {
        self.baseUrl = baseUrl
        self.session = session
    }

    func callApi(resource: Resource, callback: @escaping NetworkServiceResponse) throws {
        let request = try buildRequest(for: resource)

        let task = session.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                callback(.failure(NetworkError.noHttpResponse))
                return
            }

            if 200...299 ~= httpResponse.statusCode {
                guard let data = data else {
                    callback(.failure(NetworkError.noData))
                    return
                }

                callback(.success(data))
                return
            } else {
                callback(.failure(NetworkError.httpError(code: httpResponse.statusCode)))
                return
            }
        }

        task.resume()
    }

    private func buildRequest(for resource: Resource) throws -> URLRequest {
        guard var components = URLComponents(string: baseUrl),
            let fullPath = components.url?.appendingPathComponent(resource.path) else { throw NetworkError.invalidUrl }

        components.queryItems = resource.queryItems?.map { ($0.key, $0.value) }.map(URLQueryItem.init)
        var urlRequest = URLRequest(url: fullPath, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 120)
        urlRequest.httpMethod = resource.method.rawValue

        return urlRequest
    }
}
