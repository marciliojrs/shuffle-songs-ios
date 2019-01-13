import XCTest

class TrackListRobot: Robot {
    lazy private var view  = app.otherElements["trackListView"]
    lazy private var loadingView  = app.activityIndicators["loadingView"]
    lazy private var tableView = app.tables["tableView"]
    lazy private var navigationBar = app.navigationBars["Shuffle Songs"]
    lazy private var shuffleButton = navigationBar.buttons["shuffle"]

    @discardableResult func waitSplashDisappear() -> Self {
        sleep(1)
        XCTAssert(view.waitForExistence(timeout: 5))

        return self
    }

    @discardableResult func tapShuffle() -> Self {
        shuffleButton.tap()
        sleep(2)

        return self
    }

    @discardableResult func checkIfFirstFiveCellsAreFromTheSameArtist() -> Self {
        let artist1 = tableView.cells["cell_0"].staticTexts["trackArtistLabel"].label
        let artist2 = tableView.cells["cell_1"].staticTexts["trackArtistLabel"].label
        let artist3 = tableView.cells["cell_2"].staticTexts["trackArtistLabel"].label
        let artist4 = tableView.cells["cell_3"].staticTexts["trackArtistLabel"].label
        let artist5 = tableView.cells["cell_4"].staticTexts["trackArtistLabel"].label

        let set = Set<String>(arrayLiteral: artist1, artist2, artist3, artist4, artist5)
        XCTAssert(set.count == 1)

        return self
    }

    @discardableResult func checkIfFirstFiveCellsAreFromDifferentArtists() -> Self {
        let artist1 = tableView.cells["cell_0"].staticTexts["trackArtistLabel"].label
        let artist2 = tableView.cells["cell_1"].staticTexts["trackArtistLabel"].label
        let artist3 = tableView.cells["cell_2"].staticTexts["trackArtistLabel"].label
        let artist4 = tableView.cells["cell_3"].staticTexts["trackArtistLabel"].label
        let artist5 = tableView.cells["cell_4"].staticTexts["trackArtistLabel"].label

        let set = Set<String>(arrayLiteral: artist1, artist2, artist3, artist4, artist5)
        XCTAssert(set.count == 5)

        return self
    }

    @discardableResult func waitForTableViewLoad() -> Self {
        XCTAssert(tableView.waitForExistence(timeout: 5))
        return self
    }
}
