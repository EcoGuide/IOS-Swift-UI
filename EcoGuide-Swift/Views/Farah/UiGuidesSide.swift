import SwiftUI
struct UiGuidesSide: View {
    @State private var username: String = ""
    @StateObject var guideViewModel: GuideViewModel
    @State private var searchText: String = ""
    @State private var discountCode: Double = 0.0
    @State private var selectedFilter = "paid"
    let guideId = "655a6231f8e97e3556636274"
    let filters = ["paid", "not payed"]
 
    
    var filteredGuides: [Guide] {
        if searchText.isEmpty {
            return guideViewModel.guides
        } else {
            return guideViewModel.guides.filter { guide in
                guide.fullname.localizedCaseInsensitiveContains(searchText) ||
                guide.location.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView { // Wrap the content in NavigationView
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Hello Guide ").padding()
                    
                    TextField(
                        "Search",
                        text: $searchText
                    )
                    .padding(.trailing, 20)
                    .padding(10)
                    .textFieldStyle(CustomTextFieldStyle())
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(filters, id: \.self) { filter in
                                
                                Button(action: {
                                    selectedFilter = filter
                                }) {
                                    Text(filter)
                                        .foregroundColor(selectedFilter == filter ? .white : .blue)
                                        .padding(EdgeInsets(top: 12, leading: 25, bottom: 12, trailing: 25))
                                        .background(selectedFilter == filter ? Color.blue : Color.clear)
                                        .cornerRadius(32)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(selectedFilter == filter ? Color.blue : Color.blue, lineWidth: 2)
                                        )
                                }
                            }
                        }
                        
                    }
                    .padding(10)
                    
                    
                    HStack {
                        Text("Recently Booked")
                            .font(.system(size: 22, weight: .semibold))
                        Spacer()
                        Text("See all")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(Color.blue)
                    }
                    .padding(.trailing, 20)
                    .padding(10)

                    ForEach(guideViewModel.reservations, id: \._id) { reservations in
                       ZStack {
                            Color(hex: "F3F8FE")
                                .frame(height: 150).frame(width: 350)
                                .cornerRadius(20)
                            HStack(spacing: 5) {
                               // AsyncImageView(url: guide.image)
//                                    .frame(width: 100, height: 100)
//                                    .cornerRadius(10)
//                                    .padding(.leading, 10)
                                VStack(alignment: .leading, spacing: 15) {
                                    Text(reservations.guideId)
                                        .font(.system(size: 23, weight: .semibold))
                                    Text(reservations.userId.name)
                                        .font(.system(size: 16))
                                        .foregroundColor(Color.gray)
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                        Text(reservations.location)
                                            .font(.system(size: 15))
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                Spacer()
                                VStack(alignment: .trailing, spacing: 15) {
                                    //Text(reservations.hoursBooked)
                                      //  .font(.system(size: 23, weight: .semibold))
                                        //.foregroundColor(Color.blue)
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
                    .padding(.leading, 1)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        HStack {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .foregroundColor(Color(.black))
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action for bell button
                    }) {
                        HStack {
                            Image(systemName: "bell")
                        }
                    }
                    .foregroundColor(Color(.black))
                }
            }
            .padding(.top, 20)
            .onAppear {
                guideViewModel.fetchGuideReservations(guideId: guideId)
            }
        }
    }
}

struct UiGuidesSide_Previews: PreviewProvider {
    static var previews: some View {
        UiGuidesSide(guideViewModel: GuideViewModel())
    }
}
