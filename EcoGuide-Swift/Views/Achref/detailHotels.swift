//
//  detailHotels.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 16/11/2023.
//

import SwiftUI

struct detailHotels: View {
    var hotelInfo: Hotel
    @Binding var discountcode: Double
    var body: some View {
        NavigationView{
                       VStack(alignment:.leading,spacing: 20) {
                           AsyncImage(url: URL(string: hotelInfo.image)) { phase in
                               phase.image?
                                   .resizable()
                                   .cornerRadius(32)
                                   .frame(height: 250)
                           }
                              
                           
                               
                               .padding(.top, 15)
                           
                           HStack {
                               Text(hotelInfo.hotelname)
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
                               Text(hotelInfo.rating).font(.system(size: 16)).foregroundColor(.gray)
                           }
                           
                           
                           // Location du guide
                           Text(hotelInfo.location)
                               .foregroundColor(.gray)
                               .padding(.bottom, 16)
                           
                           
                           Text(hotelInfo.description)
                               .font(.body).lineLimit(nil)
                              
                           
                           
                           Button("Read more") {
                               // Action to show the map
                           }
                           .foregroundColor(Color.blue)
                           .padding(.top, 16)
                           
                           // Galerie d'images avec bouton "View All"
                           Text("Options")
                               .font(.title2)
                               .fontWeight(.bold)
                              
                           
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
                                   Text("\(hotelInfo.price)")
                                       .font(.system(size: 22, weight: .semibold))
                                       .foregroundColor(Color.blue)
                                   
                               }
                               Spacer()
                               
                               Section {
                                   NavigationLink(destination: bookingHotel(hotelViewModel: HotelViewModel(), hotel: .constant(hotelInfo), discountCode: $discountcode)){
                                       
                                       Text("Book Now")
                                                                                   .font(.system(size: 16, weight: .semibold))
                                                                                      .padding()
                                                                                      .frame(width: 130, height: 30)
                                                                                      .background(Color.blue)
                                                                                      .foregroundColor(.white)
                                                                                      .cornerRadius(10)
                                       
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

struct detailHotels_Previews: PreviewProvider {
    
    @State private static var discountcode: Double = 0.0
    static var previews: some View {
        detailHotels(hotelInfo: Hotel(_id: "test",hotelname: "hotel 8", nbChambre: 100,nbStars:5, location:"Tunis",Favoris:1,rating:"500",image: "hotel6", description: "description",price: 200),discountcode: $discountcode)
    }
}
