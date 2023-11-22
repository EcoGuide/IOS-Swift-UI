//
//  HomeViewGuide.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 6/11/2023.
//

import SwiftUI




struct HomeViewGuide: View {
    @State private var username: String = ""
    @StateObject var guideViewModel: GuideViewModel
    @State private var searchText: String = ""
    @State private var selectedFilter = "Recommended"
    @State private var discountCode: Double = 0.0

    let filters = ["Recommended", "Popular", "Trending", "Testing"]

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
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Hello, User").padding()
                        TextField(
                            "Search",
                            text: $searchText
                        )
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
                                ForEach(filteredGuides, id: \._id) { guide in
                                    NavigationLink(destination: detailGuide(guideInfo: guide, discountcode: $discountCode)) {
                                        ZStack {
                                            AsyncImageView(url: guide.image)
                                                .scaledToFill()
                                                .frame(width: 300, height: 300)
                                                .cornerRadius(50)

                                            HStack {
                                                VStack(alignment: .leading, spacing: 10) {
                                                    Text(guide.fullname)
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                    Text(guide.location)
                                                        .font(.headline)
                                                        .foregroundColor(.black)
                                                    Text("\(guide.price)")
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                }
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                                .padding()
                                                Spacer()
                                                HStack {
                                                    Text("\(guide.reviews)")
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.yellow)
                                                }
                                                .padding()
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                            }
                                        }
                                    }
                                    .frame(width: 300, height: 300)
                                     
                                }
                            }
                        }

                        HStack {
                            Text("Recently Booked")
                                .font(.system(size: 22, weight: .semibold))
                            Spacer()
                            Text("See all")
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(Color.blue)
                        }
                    
                        

                        ForEach(filteredGuides, id: \._id) { guide in
                            NavigationLink(destination: detailGuide(guideInfo: guide, discountcode: $discountCode)) { ZStack {
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
                            
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(hex: "F3F8FE"))
                                    .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: 4)
                            )
                        }
                              
                        }
                        
                    }
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
                guideViewModel.fetchGuides()
            }
            
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
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
            
            .foregroundColor(Color(.black))
        }.padding(10)
        .frame(width: UIScreen.main.bounds.width / 1,
               height: UIScreen.main.bounds.width / 8)
        .foregroundColor(Color(hex: "F3F8FE"))
         // Added padding
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0

        scanner.scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

struct HomeViewGuide_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewGuide(guideViewModel: GuideViewModel())
    }
}
