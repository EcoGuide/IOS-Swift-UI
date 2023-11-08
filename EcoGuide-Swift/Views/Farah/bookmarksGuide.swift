import SwiftUI

struct ImageInfos: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var location: String
    var price: String
    var rating: String
}

struct bookmarksGuide: View {
    @State private var isGridViewSelected = true
    @State private var isListViewSelected = false
    @State private var discountCode: Double = 0.0
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    @State private var imageInfoList: [ImageInfo] = [
        ImageInfo(imageName: "guide1", title: "Flen Fouleni", location: "tunis, France", price: "$29 / day", rating: "String"),
        ImageInfo(imageName: "guide2", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),
        ImageInfo(imageName: "guide3", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),
        ImageInfo(imageName: "guide3", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),// Add more image info items for each image// Add more image info items for each image
     ]
    
    @State private var guideInfoList: [GuideInfo1] = [
        GuideInfo1(name: "Flen Fouleni", location: "tunis, France", imageName: "guide1", description: "Guide Description", reviews: "String", price: "$29 / day"),
        GuideInfo1(name: "Flen Fouleni", location: "tunis,s France", imageName: "guide2", description: "Guide Descriptions", reviews: "String", price: "$29 / day"),
        GuideInfo1(name: "Flen Fouleni", location: "tunis, France", imageName: "guide3", description: "Guide Description", reviews: "String", price: "$29 / day"),
        // Add more image info items for each image
    ]

    @State private var showingAlert = false
    @State private var selectedBookmark: GuideInfo1?

    var body: some View {
        NavigationStack {
            ScrollView{
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 22, weight: .semibold))
                    Text("Bookmark")
                        .font(.system(size: 22, weight: .semibold))
                    Spacer()
                    HStack {
                        Image(systemName: "doc.fill") // list view item
                            .font(.system(size: 24))
                            .foregroundColor(Color.blue)
                        Button(action: {
                            isGridViewSelected.toggle()
                        }) {
                            Image(systemName: isGridViewSelected ? "list.dash" : "square.grid.2x2")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                        }
                    }
                    
                    
                }

                if isGridViewSelected {
                    gridView
                    
                } else {
                   listView
                    
                }
            }
            .padding()
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
        
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 10) {
            ForEach(guideInfoList) { imageInfo in
                NavigationLink(destination: detailGuide(guideInfo: imageInfo, discountcode: $discountCode ))
                                                        {
                    BookmarkItemView(imageInfo: imageInfo)
                        .contextMenu {
                            Button(action: {
                                selectedBookmark = imageInfo
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
    

    var listView: some View {
            ForEach(imageInfoList) { imageInfo in
                HStack {
                    NavigationLink(destination: ImageDetailView(imageInfo: imageInfo)) {
                        listBookmarkItemView(imageInfo: imageInfo)
                    }
                    .listRowInsets(EdgeInsets())
                    
                    
                }
            }.onDelete(perform: deleteItem)
            
    }
    
    func deleteItem(at offsets: IndexSet) {
        if let index = offsets.first {
            imageInfoList.remove(at: index)
        }
    }
    
    

      func removeBookmark(bookmark: GuideInfo1) {
          if let index = imageInfoList.firstIndex(where: { $0.id == bookmark.id }) {
              imageInfoList.remove(at: index)
          }
      }
  }

struct listBookmarkItemView: View {
    var imageInfo: ImageInfo
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
                 }
             }
             .frame(maxWidth: .infinity)
             Spacer()
             VStack(alignment: .trailing, spacing: 15) {
                 Text("$35")
                     .font(.system(size: 23, weight: .semibold))
                     .foregroundColor(Color.blue)
                 Text("/ day")
                 Image(systemName: "bookmark")
                     .font(.system(size: 20))
                     .foregroundColor(Color.black)
             }
                Spacer()
             
                
                
         }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        }
        .padding(.trailing, 4)
    }
}



struct BookmarkItemView: View {
    var imageInfo: GuideInfo1
    
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
                    Text(imageInfo.name)
                        .font(.system(size: 23, weight: .semibold))
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(imageInfo.reviews)
                            .font(.system(size: 15))
                    }
                    Text(imageInfo.location)
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray)
                    
                    HStack(spacing: 15) {
                        Text("$35")
                            .font(.system(size: 23, weight: .semibold))
                            .foregroundColor(Color.blue)
                        Text("/ day").foregroundColor(Color.blue)
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
struct ImageDetailView: View {
    var imageInfo: ImageInfo

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



struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
    bookmarksGuide()
    }
}
