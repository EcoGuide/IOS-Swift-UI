//
//  HomeAndHotelViews.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 16/11/2023.
//

import SwiftUI

struct HomeAndHotelViews: View {
    @State private var username: String = ""
       @StateObject var hotelViewModel: HotelViewModel
       @State private var searchText: String = ""
       @State private var selectedFilter = "Recommended"
       @State private var discountCode: Double = 0.0
    let filters = ["Recommended", "Popular", "Trending", "Testing"]
    var filteredHotel: [Hotel] {
            if searchText.isEmpty {
                return hotelViewModel.hotels
            } else {
                return hotelViewModel.hotels.filter { hotel in
                    hotel.hotelname.localizedCaseInsensitiveContains(searchText) ||
                        hotel.location.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    var body: some View {NavigationStack {
        ScrollView {
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Hello, User")

                    TextField(
                        "Search",
                        text: $searchText
                    )
                    .padding(.trailing, 20)
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

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(filteredHotel, id: \._id) { hotel in
                                NavigationLink(destination: detailHotels(hotelInfo: hotel, discountcode: $discountCode)) {
                                    ZStack {
                                        AsyncImageView(url: hotel.image)
                                            .scaledToFill()
                                            .frame(width: 300, height: 300)
                                            .cornerRadius(50)
                                            
                                        
                                        HStack {
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text(hotel.hotelname)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                Text(hotel.location)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                Text("\(hotel.price)")
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                            .padding()
                                            Spacer()
                                            HStack {
                                                Text("\(hotel.nbStars)")
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.yellow)
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                        }
                                    }
                                }
                                .frame(width: 300, height: 300)
                                .padding()
                            }
                        }
                    }

                    HStack {
                        Text("Recently Booked")
                            .font(.system(size: 22, weight: .semibold))
                        Spacer()
                        NavigationLink(destination: RecentlyBookedAccomodations( hotelViewModel: hotelViewModel)) {
                                                          Text("See all")
                                                              .font(.system(size: 22, weight: .semibold))
                                                              .foregroundColor(Color.blue)
                                                      }
                    }.padding(.trailing, 20)

                    ForEach(filteredHotel, id: \._id) { hotel in
                        NavigationLink(destination: detailHotels(hotelInfo: hotel, discountcode: $discountCode)) {
                            ZStack {
                                Color(hex: "F3F8FE")
                                    .frame(width: 350, height: 150)
                                    .cornerRadius(20)
                                HStack(spacing: 5) {
                                    AsyncImageView(url: hotel.image)
                                        .scaledToFit()
                                        .cornerRadius(15)
                                        .frame(width: 150, height: 120)
                                    VStack(alignment: .leading, spacing: 15) {
                                        Text(hotel.hotelname)
                                            .font(.system(size: 23, weight: .semibold))
                                        Text(hotel.location)
                                            .font(.system(size: 16))
                                            .foregroundColor(Color.gray)
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                                .font(.system(size: 10))
                                            Text("\(hotel.nbStars)")
                                            Text("\(hotel.rating) reviews")
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 15) {
                                        Text("\(hotel.price)")
                                            .font(.system(size: 23, weight: .semibold))
                                            .foregroundColor(Color.blue)
                                        Text("/ day")
                                        Image(systemName: "bookmark")
                                            .font(.system(size: 20))
                                            .foregroundColor(Color.black)
                                    }
                                }
                                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                            }
                        }.padding(.trailing, 20)
                    }.padding(.leading, 20)
                }
            }
        }.toolbar {
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
            hotelViewModel.fetchHotels()
        }
    }
}
}
struct CustomTextFieldStyles: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    
                configuration
                Image("filterIcon")
                    .padding(.trailing)
                    .colorMultiply(Color.white)
                
                
            }
            .padding(.leading)
            .foregroundColor(Color(.black))
        }.frame(width: UIScreen.main.bounds.width / 1.1,
                height: UIScreen.main.bounds.width / 8)
        .foregroundColor(Color(hex: "F3F8FE"))
    }
}

struct HomeAndHotelViews_Previews: PreviewProvider {
    static var previews: some View {
        HomeAndHotelViews(hotelViewModel: HotelViewModel())
    }
}
