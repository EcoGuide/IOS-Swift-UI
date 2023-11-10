//
//  RecentlyBookedAccomodation.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 8/11/2023.
//


import SwiftUI

struct ImageInfoA1: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let location: String
    let price: String
    let rating: String
    let nbrating: String
    
}

struct RecentlyBookedAccomodation: View {
    @State private var isGridViewa = false
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2) // 2 columns
 
    @State private var imageInfoList: [ImageInfoA1] = [
        ImageInfoA1(imageName: "home1", title: "Home 1", location: "tunis, France", price: "$29 / night",rating: "3.6", nbrating: "(3.67 reviews)"),
        ImageInfoA1(imageName: "home2", title: "Home 2", location: "Paris, France", price: "$29 / night", rating: "4.0", nbrating: "(4.07 reviews)"),
        ImageInfoA1(imageName: "hotel1", title: "Hotel 1", location: "Paris, France", price: "$29 / night", rating: "4.5", nbrating: "(4.57 reviews)"),
        ImageInfoA1(imageName: "hotel2", title: "Hotel 2", location: "Paris, France", price: "$29 / night", rating: "5.0", nbrating: "(5.07 reviews)"),// Add more image info items for each image// Add more image info items for each image
     ]

    var body: some View {
        ScrollView {
            Spacer()
            HStack {
                Image(systemName: "arrow.left")
                    .font(.system(size: 22, weight: .semibold))
                Text("Recently Booked")
                    .font(.system(size: 22, weight: .semibold))
                Spacer()
                HStack {
                    Image(systemName: "doc.fill") // list view item
                        .font(.system(size: 24))
                        .foregroundColor(Color.blue)
                    Button(action: {
                        isGridViewa.toggle()
                    }) {
                        Image(systemName: isGridViewa ? "list.dash" : "square.grid.2x2")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.trailing, 20)

            if isGridViewa {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(imageInfoList) { imageInfo1 in
                        GridItemViewA(imageInfo1: imageInfo1)
                    }
                }
                .padding(.trailing, 20)
            } else {
                ForEach(imageInfoList) { imageInfo1 in
                    ListItemViewAccomodation(imageInfo1: imageInfo1)
                }
                .padding(.trailing, 20)
            }
        }
        .padding()
    }
}

struct GridItemViewA: View {
    var imageInfo1: ImageInfoA1

    var body: some View {
        ZStack {
            Color(hex: "F3F8FE")
                .frame(height: 250)
                .cornerRadius(20)
            VStack(spacing: 5) {
                Image(imageInfo1.imageName)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
                Text(imageInfo1.title)
                    .font(.system(size: 23, weight: .semibold))
              
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(imageInfo1.rating)
                        .font(.system(size: 15))
                    Text(imageInfo1.nbrating)
                        .font(.system(size: 10))
                }
                Text(imageInfo1.location)
                    .font(.system(size: 16))
                    .foregroundColor(Color.gray)
                
                HStack(spacing: 15) {
                    Text("$35")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.blue)
                    Text("/ night")
                    Image(systemName: "bookmark")
                        .font(.system(size: 24))
                        .foregroundColor(Color.black)
                }
            }
            .frame(width:160)
        
          
        }
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        )
    }
}

struct ListItemViewAccomodation: View {
    var imageInfo1: ImageInfoA1

    var body: some View {
           ZStack {
               Color(hex: "F3F8FE")
                   .frame(height: 150).frame(width: 350)
                   .cornerRadius(20)
               HStack(spacing: 5) {
                   Image(imageInfo1.imageName)
                       .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 15) {
                    Text(imageInfo1.title)
                        .font(.system(size: 23, weight: .semibold))
                    Text(imageInfo1.location)
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(imageInfo1.rating)
                            .font(.system(size: 15))
                        Text(imageInfo1.nbrating)
                            .font(.system(size: 10))
                    }
                }
                .frame(maxWidth: .infinity)
                Spacer()
                VStack(alignment: .trailing, spacing: 15) {
                    Text("$35")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.blue)
                    Text("/ night")
                    Image(systemName: "bookmark")
                        .font(.system(size: 24))
                        .foregroundColor(Color.black)
                }
            }
               .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        }
        .padding(.trailing, 4)
    }
}
struct RecentlyBookedAccomodation_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyBookedAccomodation()
    }
}
