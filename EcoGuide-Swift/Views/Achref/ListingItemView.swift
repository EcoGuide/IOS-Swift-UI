//
//  ListingItemView.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 11/11/2023.
//

import SwiftUI
struct ImageInfoA: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let location: String
    let price: String
    let rating: String
    let nbrating: String
    let reviews: String
    var galleryImagesA: [String]
    var description: String
}
struct ListingDetailView: View {
   
    @State private var imageInfoList: [ImageInfoA] = [
        ImageInfoA(imageName: "home1", title: "home 1", location: "tunis, France", price: "$29 / day",rating: "3.6", nbrating: "(3.67 reviews)",reviews: "36726",galleryImagesA: ["home1", "home2", "hotel1"], description: "Hotel description")// Add more image info items for each image// Add more image info items for each image
     ]
    var body: some View {
    Text("hhh")
    }
}

#Preview {
    ListingDetailView()
}
