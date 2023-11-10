//
//  detailAccomodation.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 8/11/2023.
//

import SwiftUI
struct AccomodationInfo {
    var name: String
    var location: String
    var imageName: String
    var galleryImagesA: [String]
    var description: String
    var reviews: String
    var price: String
}
struct detailAccomodation: View {
    var accomodationInfo: AccomodationInfo
    @State private var imageInfoList: [ImageInfoA] = [
        ImageInfoA(imageName: "home1", title: "Flen Fouleni", location: "tunis, France", price: "$29 / day",rating: "3.6", nbrating: "(3.67 reviews)"),
        ImageInfoA(imageName: "home2", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "4.0", nbrating: "(4.07 reviews)"),
        ImageInfoA(imageName: "hotel1", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "4.5", nbrating: "(4.57 reviews)"),
        ImageInfoA(imageName: "hotel2", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "5.0", nbrating: "(5.07 reviews)"),// Add more image info items for each image// Add more image info items for each image
     ]
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
                    Text(accomodationInfo.name)
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
                    Text(accomodationInfo.reviews).font(.system(size: 16)).foregroundColor(.gray)
                   }
                
                
                    // Location du guide
                    Text(accomodationInfo.location)
                        .foregroundColor(.gray)
                        .padding(.bottom, 16)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Gallery")
                        .font(.title2)
                        .fontWeight(.bold)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(accomodationInfo.galleryImagesA, id: \.self) { imageName in
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
                
                Text(accomodationInfo.description)
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
                    
               
                    
                    HStack {
                        
                        VStack(alignment: .leading)
                        {
                            Text("Price")
                            Text(accomodationInfo.price)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(Color.blue)

                        }
                        Spacer()
                        Button("Book Now") {
                            // Action à effectuer lors du clic sur "Book Now"
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


struct DetailAccomodation_Previews: PreviewProvider {
    static var previews: some View {
        detailAccomodation(accomodationInfo: AccomodationInfo(
            name: "Hotel 1",
            location: "Paris, France",
            imageName: "hotel1",
            galleryImagesA: ["home1", "home2", "hotel1"],
            description: "Hotel description",
            reviews: "33326",
            price: "326$"
        ))
    }
}
