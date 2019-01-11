import UIKit

extension UIImageView {
    func downloadImage(from url: URL) {
        ImageLoader.shared.loadImage(from: url) { [unowned self] (image) in
            self.image = image
        }
    }
}
