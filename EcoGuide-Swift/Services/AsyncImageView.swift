import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var data = Data()

    init(url: String) {
        guard let imageURL = URL(string: url) else { return }
        URLSession.shared.dataTaskPublisher(for: imageURL)
            .map(\.data)
            .replaceError(with: Data())
            .receive(on: DispatchQueue.main)
            .assign(to: &$data)
    }
}

struct AsyncImageView: View {
    @StateObject private var imageLoader: ImageLoader

    init(url: String) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        if let uiImage = UIImage(data: imageLoader.data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
        } else {
            // Placeholder image or loading indicator
            Color.gray
        }
    }
}
