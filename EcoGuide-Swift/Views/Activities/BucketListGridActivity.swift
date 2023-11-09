//
//  BucketListGridActivity.swift
//  EcoGuide-Swift
//
//  Created by Copper_Orka on 9/11/2023.
//

import SwiftUI

struct ImagesInfos: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var location: String
    var price: String
    var rating: String
    
    struct BucketListGridActivity: View {
        @State private var isGridViewSelected = true
        @State private var isListViewSelected = false
        @State private var discountCode: Double = 0.0
        
        @State private var isGridView = false
        var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2) // 2 columns
        
        @State private var username: String = ""
        var image = ["cappadocia", "safari", "art", "fish"]
        @State private var imageInfoList: [ImageInfo] = [
            ImageInfo(imageName: "cappadocia", title: "Ballooning", location: "Europe, Turkey", price: "Cappadocia", rating: "String"),
            ImageInfo(imageName: "safari", title: "Safari", location: "Africa, Kenya", price: "Massai Mara", rating: "string"),
            ImageInfo(imageName: "art", title: "Art Exhebition", location: "Europe, France", price: "Louvre Paris", rating: "string"),
            ImageInfo(imageName: "fish", title: "Scubadiving", location: "Oceania, Australia", price: "Coral Reef", rating: "string"),// Add more image info items for each image// Add more image info items for each image
        ]
        
        
                
        var body: some View {
            NavigationStack {
                ScrollView {
                    ZStack {
                        VStack(alignment: .leading, spacing: 10)
                        {
                            HStack{
                                Image(systemName: "arrow.left")
                                    .font(.system(size: 22, weight: .semibold))
                                Text("Bucket List")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Spacer()
                                
                                Image(systemName: isGridViewSelected ? "list.dash" : "square.grid.2x2")
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                                Image(systemName: isGridView ? "list.dash" : "square.grid.2x2")
                                    .font(.system(size: 24))
                                    .foregroundColor(.blue)
                                
                            }
                            
                            Spacer()
                            
                         
                            
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
                                Image(systemName: "bookmark.fill")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.blue)
                                
                            }
                        }
                        .foregroundColor(Color(.blue))
                    }
                }.padding(.top, 20)
                
            }
        }
    }
    
    
    
    
    
    struct BucketListGridActivity_Previews: PreviewProvider {
        static var previews: some View {
            BucketListGridActivity()
        }
    }
}
