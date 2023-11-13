//
//  HomeViewAccomodation.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 8/11/2023.
//

import SwiftUI

struct ImageInfoA: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let location: String
    let price: String
    let rating: String
    let nbrating: String
    let reviews: String
    var galleryImagesA: [String]
    var description: String
}



struct HomeViewAccomodation: View {
    @State private var username: String = ""
    var image = ["home1", "home2", "hotel1"]
    @State private var imageInfoList: [ImageInfoA] = [
        ImageInfoA(imageName: "home1", title: "home 1", location: "tunis, France", price: "$29 / day",rating: "3.6", nbrating: "(3.67 reviews)",reviews: "36726",galleryImagesA: ["home1", "home2", "hotel1"], description: "Hotel description"),
        ImageInfoA(imageName: "home2", title: "home 2", location: "Paris, France", price: "$29 / day", rating: "4.0", nbrating: "(4.07 reviews)",reviews: "40726",galleryImagesA: ["home1", "home2", "hotel1"], description: "Hotel description"),
        ImageInfoA(imageName: "hotel1", title: "hotel 1 ", location: "Paris, France", price: "$29 / day", rating: "4.5", nbrating: "(4.57 reviews)",reviews: "45726",galleryImagesA: ["home1", "home2", "hotel1"], description: "Hotel description"),
        ImageInfoA(imageName: "hotel2", title: "hotel 2 ", location: "Paris, France", price: "$29 / day", rating: "5.0", nbrating: "(5.07 reviews)",reviews: "50726",galleryImagesA: ["home1", "home2", "hotel1"], description: "Hotel description"),// Add more image info items for each image// Add more image info items for each image
     ]

    
    @State private var selectedFilter = "Recommended"
    @State private var searchText = ""
    @State private var searchResults: [ImageInfoA] = []
        let filters = ["Recommended", "Popular", "Trending", "Testing"]
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack(alignment: .leading, spacing: 20)
                    {
                        HStack {
                            //Text("Good Morning, \(Auth.currentUser?.firstname ?? "")")
                            Image("logo")
                                .resizable()
                                .frame(width: 150, height: 30)
                                .scaledToFit()
                        }
                        Text("Hello, User")
                       SearchAndFilter()
                        
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
                                ForEach(imageInfoList) { imageInfo in
                                    NavigationLink(destination: detailAccomodation(imageInfo: imageInfo, reviews: exampleReviews)) {
                                        ZStack {
                                            Image(imageInfo.imageName)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 300, height: 300)
                                                .cornerRadius(50)
                                            
                                            HStack {
                                                VStack(alignment: .leading, spacing: 10) {
                                                    Text(imageInfo.title)
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                    Text(imageInfo.location)
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                    Text(imageInfo.price)
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                }
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                                .padding()
                                                
                                                Spacer()
                                                
                                                HStack {
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.white)
                                                    Text(imageInfo.rating)
                                                        .font(.system(size: 17, weight: .semibold))
                                                        .foregroundColor(.white)
                                                        .padding(5)
                                                }
                                                .background(Color(hex: "196EEE"))
                                                .cornerRadius(150)
                                                .frame(maxWidth: 280, maxHeight: .infinity, alignment: .topTrailing)
                                                .padding(15)
                                            }
                                        }
                                        .frame(width: 300, height: 300)
                                    }
                                }
                            }
                        }
                        
                    
                    HStack {
                        Text("Recently Booked")
                            .font(.system(size: 22, weight: .semibold))
                        Spacer()
                        NavigationLink(destination: RecentlyBookedAccomodation()) {
                               Text("See all")
                                   .font(.system(size: 22, weight: .semibold))
                                   .foregroundColor(Color.blue)
                           }
                           
                    }.padding(.trailing, 20)
                    
                        ForEach(imageInfoList) { imageInfo in
                            NavigationLink(destination: detailAccomodation(imageInfo: imageInfo, reviews: exampleReviews)){
                            ZStack {
                                Color(hex: "F3F8FE") // Set your desired background color here
                                    .frame(width: 350, height: 150)
                                    .cornerRadius(15)
                                HStack(spacing: 5) {
                                    Image(imageInfo.imageName)
                                        .resizable()
                                    
                                        .cornerRadius(15)
                                        .frame(width: 130, height: 115)
                                    
                                    VStack(alignment: .leading, spacing: 15) {
                                        Text(imageInfo.imageName)
                                            .font(.system(size: 23, weight: .semibold))
                                        Text(imageInfo.location)
                                            .font(.system(size: 16))
                                            .foregroundColor(Color.gray)
                                        HStack{
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                            Text(imageInfo.rating)
                                                .font(.system(size: 15,weight: .semibold))
                                                .foregroundColor(Color(hex: "196EEE"))
                                            Text(imageInfo.nbrating)
                                                .font(.system(size: 10))
                                                .foregroundColor(Color(hex: "BDBDBD"))
                                        }
                                        
                                    }
                                    .frame(maxWidth: .infinity) // Expand to fill the available space
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 15) {
                                        Text("$35")
                                            .font(.system(size: 23, weight: .semibold))
                                            .foregroundColor(Color.blue)
                                        Text("/ day")
                                        Image(systemName: "bookmark")
                                        
                                        
                                    }
                                }
                                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                            }
                        }
                    }
                    
                    
                }.padding(.trailing, 20)
                
            }.padding(.leading, 20)
        }
    
         
            }
        }
    func performSearch(query: String) -> [ImageInfoA] {
        // Implement your search logic here
        // Return an array of search results
        // For example, you might filter your data based on the search query
        return imageInfoList.filter { $0.title.lowercased().contains(query.lowercased()) }
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

struct CustomTextFieldStyleA: TextFieldStyle {
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


struct HomeViewAccomodation_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewAccomodation()
    }
}

