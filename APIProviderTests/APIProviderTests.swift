import XCTest
@testable import APIProvider

class APIProviderTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let expectation = XCTestExpectation(description: "Network request correcly working")

        let service = NetworkService(baseUrl: "https://us-central1-tw-exercicio-mobile.cloudfunctions.net")
        let repository = MusicRepository(network: service)
        repository.lookup(artistIds: [909253,1171421960], limit: 5) { (result) in
            switch result {
            case .success(let data):
                print(data)
            case .error(let error):
                print(error)
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 20)
    }
}
