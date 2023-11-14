//
//  DetailGuide.swift
//  EcoGuide
//
//  Created by Torkhani fara on 5/11/2023.
//

import SwiftUI


struct detailGuide: View {
    var guideInfo: Guide
    @Binding var discountcode: Double
    var body: some View {
        NavigationView{
                VStack(alignment:.leading,spacing: 20) {
                    AsyncImageView(url: guideInfo.image)
                        .cornerRadius(32)
                    
                        .frame(height: 200)
                        .aspectRatio(contentMode: .fill)
                        
                        .padding(.top, 20)
                    
                    HStack {
                        Text(guideInfo.fullname)
                            .font(.title)
                            .padding(.top, 16)
                        
                        Spacer()
                        
                        Button("Show Map") {
                            // Action to show the map
                        }
                        .foregroundColor(Color.blue)
                        .padding(.top, 16)
                    }
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .foregroundColor(.gray)
                            .padding(.bottom,1)
                        Text(guideInfo.reviews).font(.system(size: 16)).foregroundColor(.gray)
                    }
                    
                    
                    // Location du guide
                    Text(guideInfo.location)
                        .foregroundColor(.gray)
                        .padding(.bottom, 16)
                    
                    
                    Text(guideInfo.description)
                        .font(.title2)
                    
                    
                    Button("Read more") {
                        // Action to show the map
                    }
                    .foregroundColor(Color.blue)
                    .padding(.top, 16)
                    
                    // Galerie d'images avec bouton "View All"
                    Text("Options")
                        .font(.title2)
                        .fontWeight(.bold)
                       
                    
                    HStack(spacing: 25){
                        ZStack {
                            Color(hex: "F3F8FE") // Set your desired background color here
                                .frame(width: 70, height: 70)
                                .cornerRadius(15)
                            
                            Image(systemName: "star.fill") // Replace "star.fill" with the desired SF Symbol name for the icon
                                .resizable()
                                .frame(width: 30, height: 30) // Adjust the size as needed
                                .foregroundColor(Color.gray)
                            
                        }
                        ZStack {
                            Color(hex: "F3F8FE") // Set your desired background color here
                                .frame(width: 70, height: 70)
                                .cornerRadius(15)
                            Image(systemName: "book") // Replace "star.fill" with the desired SF Symbol name for the icon
                                .resizable()
                                .frame(width: 30, height: 30) // Adjust the size as needed
                                .foregroundColor(Color.gray)
                            
                        }
                        ZStack {
                            Color(hex: "F3F8FE") // Set your desired background color here
                                .frame(width: 70, height: 70)
                                .cornerRadius(15)
                            Image(systemName: "heart") // Replace "star.fill" with the desired SF Symbol name for the icon
                                .resizable()
                                .frame(width: 30, height: 30) // Adjust the size as needed
                                .foregroundColor(Color.gray)
                            
                        }
                        ZStack {
                            Color(hex: "F3F8FE") // Set your desired background color here
                                .frame(width: 70, height: 70)
                                .cornerRadius(15)
                            Image(systemName: "star.fill") // Replace "star.fill" with the desired SF Symbol name for the icon
                                .resizable()
                                .frame(width: 30, height: 30) // Adjust the size as needed
                                .foregroundColor(Color.gray)
                        }
                        
                    }
                    
                    
                    
                    HStack {
                        
                        VStack(alignment: .leading)
                        {
                            Text("Price")
                            Text(String(format: "%.2f", guideInfo.price))
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(Color.blue)
                            
                        }
                        Spacer()
                        
                        Section {
                            NavigationLink(destination: bookingformGuide(discountCode: $discountcode)) {
                                
                                Button("Book Now") {
                                    // Action à effectuer lors du clic sur "Book Now"
                                }.frame(height: 30)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(15)
                                
                                
                            }
                            
                        }
                        
                    }
                }
               

            
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


struct DetailGuide_Previews: PreviewProvider {
    
    @State private static var discountcode: Double = 0.0
    static var previews: some View {
        detailGuide(guideInfo: Guide(
            _id: "qsdqsdqsdqs",
            fullname: "Flena Foueniya",
            location: "Paris, France",
            image: "guide_image",
            description: "Guide description",
            reviews: "33326",
            price: 26,
            discountCode: 22
        ),discountcode: $discountcode)
    }
}
