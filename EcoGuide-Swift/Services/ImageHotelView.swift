//
//  ImageHotelView.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 15/11/2023.
//

import Foundation
import SwiftUI
import Combine

class ImageHotelLoader : ObservableObject {
    @Published var data = Data()
    
    init(url: String){
        guard let imageURL = URL(string: url) else {return}
        URLSession.shared.dataTaskPublisher(for: imageURL)
                    .map(\.data)
                    .replaceError(with: Data())
                    .receive(on: DispatchQueue.main)
                    .assign(to: &$data)
            }
        }

struct ImageHotelView: View {
    @StateObject private var imagehotelloader: ImageHotelLoader

    init(url: String) {
        _imagehotelloader = StateObject(wrappedValue: ImageHotelLoader(url: url))
    }

    var body: some View {
        if let uiImage = UIImage(data: imagehotelloader.data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
        } else {
            // Placeholder image or loading indicator
            Color.gray
        }
    }
}
