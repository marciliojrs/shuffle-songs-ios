import UIKit

protocol SplashViewActionDelegate: class {
    func splashViewfinishAnimation()
}

final class SplashView: BaseView {
    weak var actionDelegate: SplashViewActionDelegate?

    private lazy var gradientView: GradientView = {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var logoImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var logoTextImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "appname")
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alpha = 0
        return stackView
    }()

    override func setupView() {
        addSubview(gradientView)
        stackView.addArrangedSubview(logoImage)
        stackView.addArrangedSubview(logoTextImage)
        gradientView.addSubview(stackView)

        gradientView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        gradientView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        gradientView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        stackView.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: gradientView.centerYAnchor).isActive = true
    }

    func animateAppear() {
        stackView.transform = .init(translationX: 0, y: 100)
        UIView.animate(
            withDuration: 1.3,
            delay: 0.0,
            options: UIView.AnimationOptions.curveEaseInOut,
            animations: { [stackView] in
                stackView.alpha = CGFloat(1.0)
                stackView.transform = .identity
            },
            completion: { [actionDelegate] _ in
                actionDelegate?.splashViewfinishAnimation()
            }
        )
    }
}
