//
//  RecommendedActivities.swift
//  EcoGuide-Swift
//
//  Created by Copper_Orka on 9/11/2023.
//

import SwiftUI

struct RecommendedActivities: View {
    @State private var username: String = ""
    var image = ["cappadocia", "safari", "art", "fish"]
    @State private var imageInfoList: [ImageInfo] = [
        ImageInfo(imageName: "cappadocia", title: "Ballooning", location: "Europe, Turkey", price: "Cappadocia", rating: "String"),
        ImageInfo(imageName: "safari", title: "Safari", location: "Africa, Kenya", price: "Massai Mara", rating: "string"),
        ImageInfo(imageName: "art", title: "Art Exhebition", location: "Europe, France", price: "Louvre Paris", rating: "string"),
        ImageInfo(imageName: "fish", title: "Scubadiving", location: "Oceania, Australia", price: "Coral Reef", rating: "string"),// Add more image info items for each image// Add more image info items for each image
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
                                                RoundedRectangle(cornerRadius: 32)
                                                    .stroke(selectedFilter == filter ? Color.blue : Color.blue, lineWidth: 2)
                                            )
                                    }
                                }
                            }
                        }
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(imageInfoList) { imageInfo in
                                    ZStack {
                                        Image(imageInfo.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 300, height: 380)
                                            .cornerRadius(25)
                                        VStack{
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
                                                Text("Rating")
                                                    .padding()
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                                Image(systemName: "bookmark")
                                            }
                                            
                                        }
                                    
                                    
                                    }
                                    
                                    .frame(width: 300, height: 380)
                                    
                                }
                            }
                        }
                        
                        HStack {
                            Text("Other Recommended Activities")
                                .font(.system(size: 18, weight: .semibold))
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
                                        .frame(width: 120, height: 150)
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(imageInfo.title)
                                            .font(.system(size: 23, weight: .semibold))
                                        Text(imageInfo.location)
                                            .font(.system(size: 15))
                                            .foregroundColor(Color.gray)
                                        Text(imageInfo.price)
                                            .font(.system(size: 18))
                                        
                                    }
                                    .frame(maxWidth: .infinity) // Expand to fill the available space
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 10) {
                                 
                                        Image(systemName: "bookmark")
                                        
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
                            Image(systemName: "bookmark")
                        }
                    }
                    .foregroundColor(Color(.blue))
                }
            }.padding(.top, 20)
            
        }
    }
}

struct RecommendedActivities_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedActivities()
    }
}
