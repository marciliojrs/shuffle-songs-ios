import UIKit
import Domain

final class TrackListItemCell: UITableViewCell {
    private lazy var trackNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondary
        label.numberOfLines = 2
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()

    private lazy var trackArtistLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 2
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()

    private lazy var trackImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(trackImageView)
        stackView.addArrangedSubview(trackNameLabel)
        stackView.addArrangedSubview(trackArtistLabel)
        contentView.addSubview(stackView)

        backgroundColor = .primary
        selectionStyle = .none

        setupConstraints()
    }

    private func setupConstraints() {
        trackImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18
            ).isActive = true
        trackImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        trackImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        trackImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        trackImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true

        stackView.leadingAnchor.constraint(equalTo: trackImageView.trailingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        stackView.centerYAnchor.constraint(equalTo: trackImageView.centerYAnchor).isActive = true
    }

    func bind(model: Track) {
        trackNameLabel.text = model.name
        trackArtistLabel.text = model.artistName + " (\(model.primaryGenre))"
        trackImageView.downloadImage(from: model.artwork)
    }
}
