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
}

struct HomeViewAccomodation: View {
    @State private var username: String = ""
    var image = ["guide1", "guide2", "guide3"]
    @State private var imageInfoList: [ImageInfo] = [
        ImageInfo(imageName: "home1", title: "Flen Fouleni", location: "tunis, France", price: "$29 / day", rating: "3.6"),
        ImageInfo(imageName: "home2", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),
        ImageInfo(imageName: "hotel1", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),
        ImageInfo(imageName: "hotel2", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),// Add more image info items for each image// Add more image info items for each image
     ]
    
    
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
                                ForEach(imageInfoList) { imageInfo in
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
                                            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                            .padding()
                                            Spacer()
                                            HStack {
                                                                        Text(imageInfo.rating)
                                                                            .padding(.horizontal, 8)
                                                                            .padding(.vertical, 4)
                                                                            .background(Color(hex: "196EEE"))
                                                                            .foregroundColor(.white)
                                                                            .cornerRadius(8)
                                                                        
                                                                        // Star icon
                                                                        Image(systemName: "star.fill")
                                                                            .foregroundColor(.yellow)
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
                        }.padding(.trailing, 20)
                        
                        ForEach(imageInfoList) { imageInfo in
                            ZStack {
                                Color(hex: "F3F8FE") // Set your desired background color here
                                    .frame(width: 350, height: 150)
                                    .cornerRadius(20)
                                HStack(spacing: 5) {
                                    Image(imageInfo.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                    VStack(alignment: .leading, spacing: 15) {
                                        Text(imageInfo.imageName)
                                            .font(.system(size: 23, weight: .semibold))
                                        Text(imageInfo.location)
                                            .font(.system(size: 16))
                                            .foregroundColor(Color.gray)
                                        Text(imageInfo.rating)
                                            .font(.system(size: 15))
                                    }
                                    .frame(maxWidth: .infinity) // Expand to fill the available space
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 15) {
                                        Text("$35")
                                            .font(.system(size: 23, weight: .semibold))
                                            .foregroundColor(Color.blue)
                                        Text("/ day")
                                        Text("Buttonn")
                                        
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
