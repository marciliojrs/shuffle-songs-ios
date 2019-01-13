import UIKit

extension UIImageView {
    func downloadImage(from url: URL) {
        self.image = nil
        ImageLoader.shared.loadImage(from: url) { [weak self] (image) in
            self?.image = image
        }
    }
}
