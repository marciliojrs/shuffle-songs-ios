import Foundation
import UIKit

struct ImageLoader {
    private let cache: NSCache<NSString, UIImage>

    private init() {
        cache = NSCache<NSString, UIImage>()
    }

    static let shared = ImageLoader()

    func loadImage(from url: URL, callback: ((UIImage?) -> Void)? = nil) {
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async {
                callback?(cachedImage)
            }
        } else {
            URLSession.shared.dataTask(with: url) { [cache] (data, _, _) in
                guard let data = data, let image = UIImage(data: data) else { return }
                cache.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    callback?(image)
                }
            }.resume()
        }
    }
}
