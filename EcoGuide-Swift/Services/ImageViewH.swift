//
//  ImageViewH.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 17/11/2023.
//

import SwiftUI
import Combine

class ImageLoaderG: ObservableObject {
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

struct GalleryImageView: View {
    var imageUrl: String

    var body: some View {
        AsyncImageView(url: imageUrl)
            .frame(width: 100, height: 100) // Adjust size as needed
            .cornerRadius(8)
    }
}

struct GalleryView: View {
    var gallery: [String]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(gallery, id: \.self) { imageUrl in
                    GalleryImageView(imageUrl: imageUrl)
                }
            }
            .padding()
        }
    }
}

struct AsyncImageViewG: View {
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
