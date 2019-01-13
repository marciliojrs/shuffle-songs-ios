import XCTest

class ShuffleSongsUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
    }

    func testShuffle() {
        let robot = TrackListRobot()
        robot.start()

        robot.waitSplashDisappear()
            .waitForTableViewLoad()
            .checkIfFirstFiveCellsAreFromTheSameArtist()
            .tapShuffle()
            .checkIfFirstFiveCellsAreFromDifferentArtists()
    }
}
