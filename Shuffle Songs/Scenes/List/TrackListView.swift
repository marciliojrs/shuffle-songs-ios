import UIKit
import Domain

class TrackListView: BaseView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.backgroundColor = .primary
        return tableView
    }()

    private lazy var loadingView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .whiteLarge)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.hidesWhenStopped = true
        indicatorView.transform = .init(scaleX: 1.5, y: 1.5)
        return indicatorView
    }()

    private var adapter = TrackListAdapter()

    override func setupView() {
        addSubview(tableView)
        addSubview(loadingView)
        adapter.attach(tableView)

        backgroundColor = .primary

        setupConstraints()
    }

    private func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        loadingView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    func addTracks(_ tracks: [Track]) {
        adapter.update(tracks: tracks)
    }

    func setLoading(_ isLoading: Bool) {
        tableView.isHidden = isLoading
        isLoading ? loadingView.startAnimating() : loadingView.stopAnimating()
    }

    var currentList: [Track] {
        return adapter.items
    }
}
