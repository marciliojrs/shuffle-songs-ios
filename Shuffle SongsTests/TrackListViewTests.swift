import XCTest
import Domain
@testable import Shuffle_Songs

class TrackListViewTests: XCTestCase {
    func testAddTracks() {
        let sut = TrackListView()

        let dummyArtworkUrl = URL(string: "https://dummyimage.com/300/000")!
        let tracks = [Track(id: 1, artistName: "Artist", name: "Track",
                            artwork: dummyArtworkUrl, primaryGenre: "Rock")]

        sut.addTracks(tracks)
        XCTAssertEqual(sut.currentList, tracks)
    }
}
