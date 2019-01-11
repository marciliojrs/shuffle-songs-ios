import UIKit
import Domain

class TrackListView: BaseView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        return tableView
    }()

    private var adapter = TrackListAdapter()

    override func setupView() {
        addSubview(tableView)

        adapter.attach(tableView)
        setupConstraints()
    }

    private func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    func addTracks(_ tracks: [Track]) {
        adapter.update(tracks: tracks)
    }
}
