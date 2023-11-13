//
//  detailAccomodation.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 8/11/2023.
//

import SwiftUI
struct Review: Identifiable {
    var id = UUID()
    var author: String
    var rating: Int
    var text: String
    var imagename: String
    

}

let exampleReviews: [Review] = [
    Review(author: "John Doe", rating: 4, text: "Great experience with excellent service!",imagename: "guide2"),
    Review(author: "Jane Smith", rating: 5, text: "Absolutely loved it. Highly recommended!",imagename: "guide2"),
    Review(author: "Bob Johnson", rating: 3, text: "Good but could be better. Room for improvement.",imagename: "guide2")
]
struct detailAccomodation: View {
    @State private var discountCode: Double = 0.0
    let imageInfo: ImageInfoA
    var reviews: [Review]
    var body: some View {
        ScrollView {
            VStack(alignment:.leading,spacing: 20) {
                // Image en haut de la page
                Spacer()
                Image("home1")
                    .resizable().cornerRadius(32)
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200).padding(.top,20)
              
                HStack {
                    Text(imageInfo.imageName)
                        .font(.title)
                        .padding(.top, 16)
                    
                    Spacer()
                    
                    Button("Show Map") {
                        // Action to show the map
                    }
                    .foregroundColor(Color.blue)
                    .padding(.top, 16)
                }
                HStack(alignment: .center) {
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .foregroundColor(.gray)
                        .padding(.bottom,1)
                    Text(imageInfo.reviews).font(.system(size: 16)).foregroundColor(.gray)
                   }
                
                
                    // Location du guide
                    Text(imageInfo.location)
                        .foregroundColor(.gray)
                        .padding(.bottom, 16)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Gallery")
                        .font(.title2)
                        .fontWeight(.bold)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(imageInfo.galleryImagesA, id: \.self) { imageName in
                                Image(imageName)
                                    .resizable()
                                    .frame(width: 120, height: 80)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.bottom, 16)

                    HStack {
                        Spacer()
                        Button("View All") {
                            // Action à effectuer lors du clic sur "View All"
                        }
                        .foregroundColor(Color(#colorLiteral(red: 0.09411764706, green: 0.431372549, blue: 0.9333333333, alpha: 1))) // Couleur bleue
                    }
                }
                .padding(.horizontal, 16)
                
                Text(imageInfo.description)
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
                        .padding(.bottom, 16)

                ScrollView(.horizontal, showsIndicators: false) { HStack{
                    ZStack {
                        Color(hex: "F3F8FE") // Set your desired background color here
                            .frame(width: 100, height: 90)
                            .cornerRadius(15)

                        VStack {
                            Image(systemName: "building")
                                .resizable()
                                .frame(width: 30, height: 30) // Adjust the size as needed
                                .foregroundColor(Color.gray)

                            Text("hotel")
                        }
                    }
                    ZStack {
                        Color(hex: "F3F8FE") // Set your desired background color here
                            .frame(width: 100, height: 90)
                            .cornerRadius(15)

                        VStack {
                            Image(systemName: "bed.double")
                                .resizable()
                                .frame(width: 30, height: 30) // Adjust the size as needed
                                .foregroundColor(Color.gray)

                            Text("4 Bedrooms")
                        }
                    }
                    ZStack {
                        Color(hex: "F3F8FE") // Set your desired background color here
                            .frame(width: 100, height: 90)
                            .cornerRadius(15)

                        VStack {
                            Image(systemName: "bathtub")
                                .resizable()
                                .frame(width: 30, height: 30) // Adjust the size as needed
                                .foregroundColor(Color.gray)

                            Text("2 Bathrooms")
                        }
                    }
                    ZStack {
                        Color(hex: "F3F8FE") // Set your desired background color here
                            .frame(width: 100, height: 90)
                            .cornerRadius(15)

                        VStack {
                            Image(systemName: "triangle")
                                .resizable()
                                .frame(width: 30, height: 30) // Adjust the size as needed
                                .foregroundColor(Color.gray)

                            Text("300 sqft")
                        }
                    }
                    
                }}
                
                ScrollView {
                           
                               ForEach(reviews) { review in
                                   

                                       // Review Content
                                       VStack() {
                                           Image(review.imagename)
                                               .resizable()
                                               .aspectRatio(contentMode: .fill)
                                               .frame(width: 40, height: 40)
                                               .clipShape(Circle())

                                           Text(review.author)
                                               .font(.headline)
                                               .fontWeight(.bold)

                                           Text("Rating: \(review.rating)")
                                               .font(.subheadline)
                                               .foregroundColor(.gray)

                                           Text(review.text)
                                               .font(.body)
                                               .lineLimit(50)
                                       }
                                       
                                       .frame(width:340,height:160)
                                   
                                   .background(Color.gray.opacity(0.1))
                                   .padding(10)
                                   
                                  
                               }
                           
                           .cornerRadius(10)
                           .padding()
                       }                   
               
                    
                    HStack {
                        
                        VStack(alignment: .leading,spacing: 10)
                        {
                            Text("Price")
                            Text(imageInfo.price)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(Color.blue)

                        }
                        Spacer()
                        
                        NavigationLink(destination: bookingAccomodation(discountCode: $discountCode)) {
                                           Text("Book Now")
                                            .font(.system(size: 16, weight: .semibold))
                                               .padding()
                                               .frame(width: 130, height: 30)
                                               .background(Color.blue)
                                               .foregroundColor(.white)
                                               .cornerRadius(10)
                                       }
                        
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    }
                }
                .padding(.horizontal, 16)

          
            }
            .background(Color.white)
            .cornerRadius(16)
            .padding(.horizontal, 16)
            .padding(.top, -32)
        }
    }
