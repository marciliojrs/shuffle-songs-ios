@testable import APIProvider
import Domain
import XCTest

struct LookupParams {
    let artistIds: [Int]
    let limit: Int?

    static let `default`: LookupParams = LookupParams(artistIds: [1], limit: nil)
}

struct LookupOutput {
    let tracks: [Domain.Track]?
    let error: DomainError?
}

class MusicRepositoryTests: XCTestCase {
    private func callLookup(in service: NetworkService,
                            params: LookupParams = .default,
                            output: @escaping ((LookupOutput) -> Void)) {
        let repository = MusicRepository(network: service)

        repository.lookup(artistIds: [1], limit: nil) { (result) in
            switch result {
            case .success(let tracks):
                output(LookupOutput(tracks: tracks, error: nil))
            case .error(let error):
                output(LookupOutput(tracks: nil, error: error))
            }
        }
    }

    private func createSessionMock(data: Data?, error: Error? = nil, statusCode: Int) -> URLSessionMock {
        let sessionMock = URLSessionMock()
        sessionMock.data = data
        sessionMock.error = error
        sessionMock.response = HTTPURLResponse(url: URL(string: "/lookup")!,
                                               statusCode: statusCode,
                                               httpVersion: nil,
                                               headerFields: nil)

        return sessionMock
    }

    func testLookupValidResponse() {
        let dataResponse = try? FileReader.readData(from: "lookup_valid", extension: "json")
        let networkService = NetworkService(baseUrl: "",
                                            session: createSessionMock(data: dataResponse, statusCode: 200))

        let expectation = XCTestExpectation(description: "Return expected data from lookup endpoint")

        let expectedTrack = Domain.Track(
            id: 679273550,
            artistName: "John Dollar",
            name: "Warmth of the Road",
            //swiftlint:disable:next line_length
            artwork: URL(string: "https://firebasestorage.googleapis.com/v0/b/tw-exercicio-mobile.appspot.com/o/albums%2Fjohn-dollar-antihero.png?alt=media&token=68b89bd6-87c4-4122-9998-dbd33f75f90c")!
        )

        callLookup(in: networkService) { (output) in
            XCTAssertEqual(output.tracks, [expectedTrack])
            XCTAssertNil(output.error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10)
    }

    func testLookupEmptyResponse() {
        let dataResponse = try? FileReader.readData(from: "lookup_empty_response", extension: "json")
        let networkService = NetworkService(baseUrl: "",
                                            session: createSessionMock(data: dataResponse, statusCode: 200))

        let expectation = XCTestExpectation(description: "Return expected data from lookup endpoint")
        callLookup(in: networkService) { (output) in
            XCTAssertTrue(output.tracks?.count == 0)
            XCTAssertNil(output.error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10)
    }
}
