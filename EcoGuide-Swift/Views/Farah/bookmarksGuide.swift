import SwiftUI



struct bookmarksGuide: View {
    @State private var isGridViewSelected = true
    @State private var isListViewSelected = false
    @State private var discountCode: Double = 0.0
    @StateObject var guideViewModel : GuideViewModel
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    

    
    
    
    @State private var showingAlert = false
    @State private var selectedBookmark: Guide?
    
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
            }.padding(10)
                .onAppear {
                    guideViewModel.fetchGuides()
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Remove Bookmark"),
                        message: Text("Are you sure you want to remove this bookmark?"),
                        primaryButton: .destructive(Text("Yes")) {
                            //                        if let selectedBookmark = selectedBookmark {
                            //                            removeBookmark(bookmark: selectedBookmark)
                            //                        }
                        },
                        secondaryButton: .cancel(Text("Cancel"))
                    )
                }
        }
    }
    var gridView: some View {
        LazyVGrid(columns: Array(repeating: GridItem.init(.flexible()), count: 2), spacing: 16) {
            ForEach(guideViewModel.guides ,id: \._id) { guide in
                NavigationLink(destination: detailGuide(guideInfo: guide, discountcode: $discountCode)) {
                    BookmarkItemView(guide: guide)
                        .contextMenu {
                            Button(action: {
                                selectedBookmark = guide
                                showingAlert = true
                            }) {
                                Label("Remove Bookmark", systemImage: "delete")
                            }
                        }
                }
            }
        }
    }
    
    
    var listView: some View {
        ForEach(guideViewModel.guides,id: \._id) { guide in
            HStack {
                NavigationLink(destination: detailGuide(guideInfo: guide, discountcode: $discountCode)) {
                    listBookmarkItemView(guide: guide)
                }
                .listRowInsets(EdgeInsets())
            }
        }

    }
    
    
 
    
    struct listBookmarkItemView: View {
        var guide : Guide
        var body: some View {
            ZStack {
                Color(hex: "F3F8FE")
                    .frame(height: 150).frame(width: 350)
                    .cornerRadius(20)
                HStack(spacing: 5) {
                    AsyncImageView(url: guide.image)
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .padding(.leading, 10)
                    VStack(alignment: .leading, spacing: 15) {
                        Text(guide.fullname)
                            .font(.system(size: 23, weight: .semibold))
                        Text(guide.location)
                            .font(.system(size: 16))
                            .foregroundColor(Color.gray)
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(guide.reviews)
                                .font(.system(size: 15))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 15) {
                        Text("\(guide.price)")
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
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(hex: "F3F8FE"))
                    .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: 4)
            )
        }
    }
    
    
    
    struct BookmarkItemView: View {
        var guide : Guide
        
        var body: some View {
            
            ZStack {
                Color(hex: "F3F8FE")
                    .frame(height: 280)
                    .cornerRadius(20)
                
                VStack(spacing: 5) {
                    AsyncImageView(url: guide.image)   
                        .frame(width: 145, height: 135)
                        .cornerRadius(20)
                    Text(guide.fullname)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(guide.reviews)
                            .font(.system(size: 13))
                        Text(guide.location)
                            .font(.system(size: 13))
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                    }
                    
                    
                    HStack(spacing: 15) {
                        Text("\(guide.price)")
                            .font(.system(size: 23, weight: .semibold))
                            .foregroundColor(Color.blue)
                        Text("/ day").foregroundColor(Color.blue)
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 24))
                            .foregroundColor(Color.blue)
                    }
                }
                .frame(width:180)
                
                
            }
            
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(hex: "F3F8FE"))
                    .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: 4)
            )
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
            )
            
            
        }
        
    }
    
    
    
    struct BookmarkView_Previews: PreviewProvider {
        static var previews: some View {
            bookmarksGuide(guideViewModel: GuideViewModel())
        }
    }
}
