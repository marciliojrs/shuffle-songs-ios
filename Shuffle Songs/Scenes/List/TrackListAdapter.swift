import Domain

class TrackListAdapter: NSObject, UITableViewDataSource {
    private var items: [Track] = []
    private weak var tableView: UITableView?

    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.dataSource = self

        self.tableView?.register(TrackListItemCell.self, forCellReuseIdentifier: "cell")
    }

    func update(tracks: [Track]) {
        self.items = tracks
        self.tableView?.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TrackListItemCell
            else { fatalError() }

        return cell
    }
}
