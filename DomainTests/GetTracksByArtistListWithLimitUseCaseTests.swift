import XCTest
@testable import Domain

class GetTracksUseCaseTests: XCTestCase {
    func testExecute() {
        let expectedResponse = [Track(id: 1, artistName: "Artist1", name: "Track1",
                                      artwork: URL(string: "https://dummyimage.com/300/000")!,
                                      primaryGenre: "Rock")]

        let musicRepository = MusicRepositoryMock()
        musicRepository.lookupResponse = .success(expectedResponse)
        let useCase = GetTracksByArtistListWithLimitUseCase(repository: musicRepository)

        let expectation = XCTestExpectation(description: "use case correctly return repository fetched tracks")

        useCase.execute(artists: [1]) { (result) in
            XCTAssertTrue(musicRepository.lookupCalled)
            XCTAssertEqual(musicRepository.lookupArtistIdsParam, [1])
            XCTAssertEqual(musicRepository.lookupLimitParam, 5, "must return 5 that is the default value")

            switch result {
            case .success(let tracks):
                XCTAssertEqual(tracks, expectedResponse)
                expectation.fulfill()
            default: fatalError()
            }
        }

        wait(for: [expectation], timeout: 5)
    }
}
