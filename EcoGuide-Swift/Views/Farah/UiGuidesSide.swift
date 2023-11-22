import SwiftUI
struct UiGuidesSide: View {
    @State private var username: String = ""
    @StateObject var guideViewModel: GuideViewModel
    @State private var searchText: String = ""
    @State private var discountCode: Double = 0.0
    @State private var selectedFilter = "paid"
    @State private var showChatView = false
    let guideId = "655a6231f8e97e3556636274"
 
 
    
    var filteredGuides: [ReservationGuide] {
        if searchText.isEmpty {
            return guideViewModel.reservations
        } else {
            return guideViewModel.reservations.filter { reservations in
                reservations.userId.name.localizedCaseInsensitiveContains(searchText) ||
                reservations.userId.email.localizedCaseInsensitiveContains(searchText)
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
                    .padding(10)
                    .textFieldStyle(CustomTextFieldStyle())
                    
                
                    
                    HStack {
                        Text("Reservations")
                            .font(.system(size: 22, weight: .semibold))
                        Spacer()
                        Text("See all")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(Color.blue)
                    }.padding(10).padding()
                    VStack {
                        NavigationLink(
                            destination: ContentChatView(),
                            isActive: $showChatView,
                            label: {
                                EmptyView()
                            }
                        )}
            

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
                                    Text(reservations.userId.name)
                                        .font(.system(size: 23, weight: .semibold))
                                    HStack {
                                        Text("Email :")
                                            .font(.system(size: 15)) .foregroundColor(Color.blue)
                                        Text(reservations.userId.email)
                                            .font(.system(size: 15))
                                            .foregroundColor(Color.gray)
                                    }
                                    HStack {
                                        Text("Country:")
                                            .font(.system(size: 15)) .foregroundColor(Color.blue)
                                        Text(reservations.location)
                                            .font(.system(size: 15))
                                    }
                                    
                                }
                                .frame(maxWidth: .infinity)
                                Spacer()
                                VStack(alignment: .trailing, spacing: 8) {
                                 
                                        Text("Booked Hours")
                                            .font(.system(size: 15)) .foregroundColor(Color.blue)
                                        Text(String(reservations.hoursBooked))
                                            .font(.system(size: 22, weight: .semibold))
                                            .foregroundColor(Color.blue)
                                    Button(action: {
                                              self.showChatView = true
                                          }) {
                                              Text("Chat Now").foregroundColor(.red)
                                          }
                                 
                                }
                                Spacer()
                                
                                
                                
                            }
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hex: "F3F8FE"))
                                .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: 4)
                        )
                     
                          
                    }.padding(20)
                
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
