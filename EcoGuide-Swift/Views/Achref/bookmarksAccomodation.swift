//
//  bookmarksAccomodation.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 8/11/2023.
//
import SwiftUI

struct ImageInfoAccomodation: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var location: String
    var price: String
    var rating: String
}

struct bookmarksAccomodation: View {
    @State private var isGridViewSelected = true
    @State private var isListViewSelected = false

    @State private var imageInfoList1: [ImageInfoA1] = [
        ImageInfoA1(imageName: "home1", title: "Home 1 ", location: "tunis, France", price: "$29 / day", rating: "3.5", nbrating: "(3.55)"),
        ImageInfoA1(imageName: "home2", title: "Home 2", location: "Paris, France", price: "$29 / day", rating: "4.0", nbrating: "(4.05)"),
        ImageInfoA1(imageName: "hotel1", title: "Hotel 1", location: "Paris, France", price: "$29 / day", rating: "4.5", nbrating: "(4.55)"),
        ImageInfoA1(imageName: "hotel2", title: "Hotel 2", location: "Paris, France", price: "$29 / day", rating: "5.0", nbrating: "(5.05)"),// Add more image info items for each image// Add more image info items for each image
     ]

    @State private var showingAlert = false
    @State private var selectedBookmark: ImageInfoA1?

    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $isGridViewSelected) {
                    Image(systemName: "rectangle.grid.2x2.fill")
                        .tag(true)
                        .foregroundColor(isGridViewSelected ? Color.blue : Color.blue)

                    Image(systemName: "list.bullet")
                        .tag(false)
                        .foregroundColor( Color.blue)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if isGridViewSelected {
                    gridView
                } else {
                    listView
                }
            }
            .navigationTitle("My Bookmarks")
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Remove Bookmark"),
                    message: Text("Are you sure you want to remove this bookmark?"),
                    primaryButton: .destructive(Text("Yes")) {
                        if let selectedBookmark = selectedBookmark {
                            removeBookmark(bookmark: selectedBookmark)
                        }
                    },
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
        }
    }

    var gridView: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 10) {
                ForEach(imageInfoList1) { imageInfo1 in
                    NavigationLink(destination: ImageDetailViewAccomodation(imageInfo: imageInfo1)) {
                        BookmarkItemViewAccomodation(imageInfo: imageInfo1)
                            .contextMenu {
                                Button(action: {
                                    selectedBookmark = imageInfo1
                                    showingAlert = true
                                }) {
                                    Label("Remove Bookmark", systemImage: "delete")
                                }
                            }
                    }
                }
            }
            .padding()
        }
    }

    var listView: some View {
        List {
            ForEach(imageInfoList1) { imageInfo in
                HStack {
                    NavigationLink(destination: ImageDetailViewAccomodation(imageInfo: imageInfo)) {
                        listBookmarkItemViewAccomodation(imageInfo: imageInfo)
                    }
                    .listRowInsets(EdgeInsets())
                    
                    
                }
            }.onDelete(perform: deleteItem)
            
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        if let index = offsets.first {
            imageInfoList1.remove(at: index)
        }
    }
    
    

      func removeBookmark(bookmark: ImageInfoA1) {
          if let index = imageInfoList1.firstIndex(where: { $0.id == bookmark.id }) {
              imageInfoList1.remove(at: index)
          }
      }
  }

struct listBookmarkItemViewAccomodation: View {
    var imageInfo: ImageInfoA1
    var body: some View {
        ZStack {
            Color(hex: "F3F8FE")
                .frame(height: 150)
                .frame(width: 350)
                .cornerRadius(20)
            HStack(spacing: 5) {
                Image(imageInfo.imageName)
                    .resizable()
                 .frame(width: 100, height: 100)
                 .cornerRadius(10)
                 .padding(.leading, 10)
             VStack(alignment: .leading, spacing: 15) {
                 Text(imageInfo.title)
                     .font(.system(size: 23, weight: .semibold))
                 Text(imageInfo.location)
                     .font(.system(size: 16))
                     .foregroundColor(Color.gray)
                 HStack {
                     Image(systemName: "star.fill")
                         .foregroundColor(.yellow)
                     Text(imageInfo.rating)
                         .font(.system(size: 15))
                     Text(imageInfo.nbrating)
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
                 Image(systemName: "bookmark.fill")
                     .font(.system(size: 20))
                     .foregroundColor(Color.blue)
             }
                Spacer()
             
                
                
         }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        }
        .padding(.trailing, 4)
    }
}



struct BookmarkItemViewAccomodation: View {
    var imageInfo: ImageInfoA1
    
    var body: some View {
        VStack {
            
            ZStack {
                Color(hex: "F3F8FE")
                    .frame(height: 260)
                    .cornerRadius(20)
              
                VStack(spacing: 5) {
                    Image(imageInfo.imageName)
                        .resizable()
                        .frame(width: 150, height: 120)
                        .cornerRadius(20)
                    Text(imageInfo.title)
                        .font(.system(size: 23, weight: .semibold))
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(imageInfo.rating)
                            .font(.system(size: 15))
                        Text(imageInfo.nbrating)
                            .font(.system(size: 10))
                    }
                    Text(imageInfo.location)
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray)
                    
                    HStack(spacing: 15) {
                        Text("$35")
                            .font(.system(size: 23, weight: .semibold))
                            .foregroundColor(Color.blue)
                        Text("/ night").foregroundColor(Color.blue)
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 24))
                            .foregroundColor(Color.blue)
                    }
                }
                .frame(width:160)
                
                
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
            )}}}
  // for  viewing the detail
struct ImageDetailViewAccomodation: View {
    var imageInfo: ImageInfoA1

    var body: some View {
        VStack {
            Image(imageInfo.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250).cornerRadius(20)
                .clipped()

            Text(imageInfo.title)
                .font(.title)
                .padding(.top, 16)

            Text(imageInfo.location)
                .foregroundColor(.gray)
                .padding(.bottom, 16)

            // Add the rest of the details specific to the image here
        }
        .padding()
        .navigationTitle(imageInfo.title)
    }
}



struct BookmarkView_PreviewsAccomodation: PreviewProvider {
    static var previews: some View {
    bookmarksAccomodation()
    }
}
