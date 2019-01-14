import UIKit

extension UIImageView {
    func downloadImage(from url: URL) {
        self.image = nil
        ImageLoader.shared.loadImage(from: url) { [weak self] (image) in
            self?.alpha = 0
            self?.image = image

            UIView.animate(withDuration: 0.2, animations: {
                self?.alpha = 1
            })
        }
    }
}
