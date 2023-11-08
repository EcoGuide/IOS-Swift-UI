//
//  WelcomeMsgActivities.swift
//  EcoGuide-Swift
//
//  Created by Copper_Orka on 8/11/2023.
//

import SwiftUI





struct WelcomeMsgActivities: View {
    @State private var username: String = ""
    var image = ["guide1", "guide2", "guide3"]
    @State private var imageInfoList: [ImageInfo] = [
        ImageInfo(imageName: "guide1", title: "Flen Fouleni", location: "tunis, France", price: "$29 / day", rating: "String"),
        ImageInfo(imageName: "guide2", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),
        ImageInfo(imageName: "guide3", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),
        ImageInfo(imageName: "guide3", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),// Add more image info items for each image// Add more image info items for each image
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
                                                    .foregroundColor(.black)
                                                Text(imageInfo.price)
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
            
        }
    }
}




struct WelcomeMsgActivities_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeMsgActivities()
        }
    }
