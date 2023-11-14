//
//  HomeViewGuide.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 6/11/2023.
//

import SwiftUI

struct ImageInfo: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let location: String
    let price: String
    let rating: String
}

struct HomeViewGuide: View {
    @State private var username: String = ""
    @StateObject var guideViewModel : GuideViewModel
    
    @State private var selectedFilter = "Recommended"

        let filters = ["Recommended", "Popular", "Trending", "Testing"]
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack(alignment: .leading, spacing: 20)
                    {
                        Text("Hello, User")
                        TextField(
                            "Search",
                            text: $username
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
                                ForEach(guideViewModel.guides ,id: \._id) { guide in
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
                                                Text(String(format: "%.2f", guide.price))
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                            .padding()
                                            Spacer()
                                            Text("Rating")
                                                .padding()
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
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
                        }.padding(.trailing, 20)
                        
                        ForEach(guideViewModel.guides ,id: \._id) { guide in
                            ZStack {
                                Color(hex: "F3F8FE") // Set your desired background color here
                                    .frame(width: 350, height: 150)
                                    .cornerRadius(20)
                                HStack(spacing: 5) {
                                    AsyncImageView(url: guide.image)
                                        
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                    VStack(alignment: .leading, spacing: 15) {
//                                        Text(guide.image)
//                                            .font(.system(size: 23, weight: .semibold))
                                        Text(guide.location)
                                            .font(.system(size: 16))
                                            .foregroundColor(Color.gray)
                                        Text(guide.reviews)
                                            .font(.system(size: 15))
                                    }
                                    .frame(maxWidth: .infinity) // Expand to fill the available space
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 15) {
                                        Text("$35")
                                            .font(.system(size: 23, weight: .semibold))
                                            .foregroundColor(Color.blue)
                                        Text("/ day")
                                        Text("Button")
                                        
                                    }
                                }
                                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                            }
                            
                        }.padding(.trailing, 20)
                        
                    }.padding(.leading, 20)
                    
                }
            }.toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {})
                    {
                        HStack {
                            //Text("Good Morning, \(Auth.currentUser?.firstname ?? "")")
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .foregroundColor(Color(.black))
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button (action: {
                        //
                    })
                    {
                        HStack {
                            Image(systemName: "bell")
                        }
                    }
                    .foregroundColor(Color(.black))
                }
            }.padding(.top, 20)
                .onAppear {
                    guideViewModel.fetchGuides()
                }
            
        }
    }
}

/*struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
            .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hex: "F3F8FE")) // Use an extension to create a Color from a hex string
                        )
            .foregroundColor(Color.black)
    }
}*/

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
            .padding(.leading)
            .foregroundColor(Color(.black))
        }.frame(width: UIScreen.main.bounds.width / 1.1,
                height: UIScreen.main.bounds.width / 8)
        .foregroundColor(Color(hex: "F3F8FE"))
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
