//
//  RecentlyBookedGuide.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 6/11/2023.
//

import SwiftUI

struct ImageInfo1: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let location: String
    let price: String
    let rating: String
}

struct RecentlyBookedGuide: View {
    @State private var isGridView = false
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2) // 2 columns

    var imageInfoList: [ImageInfo1] = [
        ImageInfo1(imageName: "guide1", title: "Flen Fouleni", location: "tunis, France", price: "$29 / day", rating: "String"),
        ImageInfo1(imageName: "guide2", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),
        ImageInfo1(imageName: "guide3", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "200 reviews"),
        // Add more image info items for each image
    ]

    var body: some View {
        ScrollView {
            Spacer()
            HStack {
                Image(systemName: "arrow.left")
                    .font(.system(size: 22, weight: .semibold))
                Text("Recently Booked")
                    .font(Font.custom("Urbanist-bold", size: 22).bold())
                Spacer()
                HStack {
                    Image(systemName: "doc.fill") // list view item
                        .font(.system(size: 24))
                        .foregroundColor(Color.blue)
                    Button(action: {
                        isGridView.toggle()
                    }) {
                        Image(systemName: isGridView ? "list.dash" : "square.grid.2x2")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.trailing, 20)

            if isGridView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(imageInfoList) { imageInfo in
                        GridItemView(imageInfo: imageInfo)
                    }
                }
                .padding(.trailing, 20)
            } else {
                ForEach(imageInfoList) { imageInfo in
                    ListItemView(imageInfo: imageInfo)
                }
                .padding(.trailing, 20)
            }
        }
        .padding()
    }
}

struct GridItemView: View {
    var imageInfo: ImageInfo1

    var body: some View {
        ZStack {
            Color(hex: "F3F8FE")
                
                .frame(height: 250)
                .cornerRadius(20)
            VStack(spacing: 5) {
                Image(imageInfo.imageName)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
                Text(imageInfo.title)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)

              
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(imageInfo.rating)
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                    Text(imageInfo.location)
                        .font(.system(size: 13))
                        .fontWeight(.regular)
        
                        .foregroundColor(Color.gray)
        
                }
               
                
                HStack(spacing: 15) {
                    Text("$35")
                        .font(.system(size: 18))
                        .fontWeight(.regular)
        
                        .foregroundColor(Color.blue)
                    Text("/ day").font(.system(size: 13))
                        .fontWeight(.semibold).foregroundColor(Color.blue)
                    Image(systemName: "bookmark")
                        .font(.system(size: 24))
                        .foregroundColor(Color.blue)
                }
            }
            .frame(width:160)
           
          
        } .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(hex: "F3F8FE"))
                .shadow(color: Color.black.opacity(0.4), radius: 3, x: 0, y: 4)
        )
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        )
        
    }
}

struct ListItemView: View {
    var imageInfo: ImageInfo1

    var body: some View {
           ZStack {
               Color(hex: "F3F8FE")
                   .frame(height: 150).frame(width: 350)
                   .cornerRadius(20)
               HStack(spacing: 5) {
                   Image(imageInfo.imageName)
                       .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 15) {
                    Text(imageInfo.title)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text(imageInfo.location)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(imageInfo.rating)
                            .font(.system(size: 15))
                    }
                }
                .frame(maxWidth: .infinity)
                Spacer()
                VStack(alignment: .trailing, spacing: 15) {
                    Text("$35")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.blue)
                    Text("/ day").foregroundColor(Color.blue) .fontWeight(.semibold)
                    Image(systemName: "bookmark")
                        .font(.system(size: 24))
                        .foregroundColor(Color.black)
                }
            }
               .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
               
        }
        .padding(.trailing, 4)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(hex: "F3F8FE"))
                .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: 2)
        )
    }
}
struct RecentlyBookedGuide_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyBookedGuide()
    }
}
