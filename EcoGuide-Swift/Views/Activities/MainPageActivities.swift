//
//  MainPageActivities.swift
//  EcoGuide-Swift
//
//  Created by Copper_Orka on 8/11/2023.
//

import SwiftUI

struct MainPageActivities: View {
    @State private var username: String = ""
    var image = ["cappadocia", "safari", "art", "fish"]
    @State private var imageInfoList: [ImageInfo] = [
        ImageInfo(imageName: "cappadocia", title: "Ballooning", location: "Europe, Turkey", price: "Cappadocia", rating: "String"),
        ImageInfo(imageName: "safari", title: "Safari", location: "Africa, Kenya", price: "Massai Mara", rating: "string"),
        ImageInfo(imageName: "art", title: "Art Exhebition", location: "Europe, France", price: "Louvre Paris", rating: "string"),
        ImageInfo(imageName: "fish", title: "Scubadiving", location: "Oceania, Australia", price: "Coral Reef", rating: "string"),// Add more image info items for each image// Add more image info items for each image
     ]
    
    var imagecat = ["wildlife", "marine", "artt", "artt","taj","sal"]
    @State private var imageInfoCat: [ImageInfos] = [
        ImageInfos(imageName: "wildlife",  title: "Wild Life", location: "Europe, Turkey", price: "Cappadocia", rating: "String"),
        ImageInfos(imageName: "marine", title: "Marine Life", location: "Europe, Turkey", price: "Cappadocia", rating: "String"),
        ImageInfos(imageName: "adrenaline", title: "Adrenaline", location: "Europe, Turkey", price: "Cappadocia", rating: "String"),
        ImageInfos(imageName: "artt", title: "Art Venues", location: "Europe, Turkey", price: "Cappadocia", rating: "String"),
        ImageInfos(imageName: "taj", title: "Sightseeing", location: "Europe, Turkey", price: "Cappadocia", rating: "String"),
        ImageInfos(imageName: "sal", title: "Gastronomy", location: "Europe, Turkey", price: "Cappadocia", rating: "String"),// Add more image info items for each image// Add more image info items for each image
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
                                            }
                                        }
                                    
                                    
                                    }
                                    
                                    .frame(width: 300, height: 380)
                                    
                                }
                            }
                        }
                        
                        HStack {
                            Text("Categories")
                                .font(.system(size: 28, weight: .bold))
                        }.padding(.trailing, 20)
                        
                        
                        
                        
                        
                      
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(imageInfoCat) { imageInfos in
                                    ZStack {
                                        Image(imageInfos.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 300, height: 180)
                                            .cornerRadius(25)
                                        
                                   
                                        Text(imageInfos.title)
                                        
                                            .font(.title)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .padding()
                                
                                    
                                    }
                                    
                                    .frame(width: 300, height: 180)
                                    
                                }
                            }
                        }
                        
                        
                        
                        Spacer()
                        
                        Button(action: {
                            // Logique de connexion
         
                        }) {
                            Text("Plan a Trip")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(20)
                                .padding(.horizontal, 32)
                        }
                        .padding(.top, 20)
                       // .shadow(color: .black, radius: 70, x: 1, y: 30)
                        
                        
                        Button(action: {
                            // Logique de connexion
         
                        }) {
                            Text("Plan a Trip")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(Color.init(hex:"F1F6FE"))
                                .cornerRadius(20)
                                .padding(.horizontal, 32)
                        }
                        .shadow(color: .black, radius: 70, x: 1, y: 30)
                        
                        
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
                                .font(.system(size: 25))

                        }
                    }
                    .foregroundColor(Color(.blue))
                }
            }.padding(.top, 20)
            
        }
    }
}

struct MainPageActivities_Previews: PreviewProvider {
    static var previews: some View {
        MainPageActivities()
    }
}
