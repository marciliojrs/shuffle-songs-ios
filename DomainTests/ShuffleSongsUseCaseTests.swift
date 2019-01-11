import XCTest
@testable import Domain

class DomainTests: XCTestCase {
    func testIfShuffleWillReturnDifferentLists() {
        let useCase = ShuffleSongsUseCase()
        let array = tracksArray()

        let shuffled1 = useCase.execute(tracks: array)
        let shuffled2 = useCase.execute(tracks: array)
        let shuffled3 = useCase.execute(tracks: array)
        let shuffled4 = useCase.execute(tracks: array)

        let set = Set<[Track]>(arrayLiteral: shuffled1, shuffled2, shuffled3, shuffled4)

        XCTAssertTrue(set.count == 4)
    }

    func testIfShuffledArrayDoesntHaveEqualArtistsClose() {
        let useCase = ShuffleSongsUseCase()
        let array = tracksArray()

        let shuffled1 = useCase.execute(tracks: array)

        XCTAssertTrue(checkIfItemsInArrayAreFromDifferntArtist(shuffled1))
    }

    private func checkIfItemsInArrayAreFromDifferntArtist(_ array: [Track]) -> Bool {
        for i in 0...array.count - 2 {
            if array[i].artistName == array[i+1].artistName {
                return false
            } else {
                continue
            }
        }

        return true
    }

    private func tracksArray() -> [Track] {
        let dummyArtworkUrl = URL(string: "https://dummyimage.com/300/000")!

        let t1a1 = Track(id: 1, artistName: "Artist1", name: "Track1", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t2a1 = Track(id: 2, artistName: "Artist1", name: "Track2", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t3a1 = Track(id: 3, artistName: "Artist1", name: "Track3", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t4a1 = Track(id: 4, artistName: "Artist1", name: "Track4", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t5a1 = Track(id: 5, artistName: "Artist1", name: "Track5", artwork: dummyArtworkUrl, primaryGenre: "Rock")

        let t1a2 = Track(id: 6, artistName: "Artist2", name: "Track1", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t2a2 = Track(id: 7, artistName: "Artist2", name: "Track2", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t3a2 = Track(id: 8, artistName: "Artist2", name: "Track3", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t4a2 = Track(id: 9, artistName: "Artist2", name: "Track4", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t5a2 = Track(id: 10, artistName: "Artist2", name: "Track5", artwork: dummyArtworkUrl, primaryGenre: "Rock")

        let t1a3 = Track(id: 11, artistName: "Artist3", name: "Track1", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t2a3 = Track(id: 12, artistName: "Artist3", name: "Track2", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t3a3 = Track(id: 13, artistName: "Artist3", name: "Track3", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t4a3 = Track(id: 14, artistName: "Artist3", name: "Track4", artwork: dummyArtworkUrl, primaryGenre: "Rock")
        let t5a3 = Track(id: 15, artistName: "Artist3", name: "Track5", artwork: dummyArtworkUrl, primaryGenre: "Rock")

        return [t1a1, t2a1, t3a1, t4a1, t5a1, t1a2, t2a2, t3a2, t4a2, t5a2, t1a3, t2a3, t3a3, t4a3, t5a3]
    }
}
