import UIKit

class GradientView: UIView {
    override open class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}

extension GradientView {
    var gradientLayer: CAGradientLayer {
        return layer as? CAGradientLayer ?? CAGradientLayer(layer: layer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        gradientLayer.colors = [UIColor.primary.cgColor, UIColor.secondary.cgColor]
        gradientLayer.startPoint = .zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
}
