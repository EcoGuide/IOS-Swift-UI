//
//  statusAccommodation.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 8/11/2023.
//
import SwiftUI
struct ImageInfoss: Identifiable, Hashable {
    var id = UUID()
    var imageName: String
    var title: String
    var location: String
    var price: String
    var etat: String
    var racing: String
    var isBookmarked: Bool = false
    var nbrating: String
}
struct PccMH: View {
    @State private var selectedEtat: String = "All"

       @State private var imageInfoList: [ImageInfoss] = [
        ImageInfoss(imageName: "home1", title: "home desc", location: "Paris, France", price: "$299 / day", etat: "canceled", racing: "5.0", nbrating: "5.05"),
        ImageInfoss(imageName: "home2", title: "home2 desc", location: "Paris, France", price: "$299/ day", etat: "paid", racing: "5.0", nbrating: "5.05"),
        ImageInfoss(imageName: "hotel2", title: "Hotel 3 desc", location: "Paris, France", price: "$299/ day", etat: "completed", racing: "5.0", nbrating: "5.05"),
       ]

       var body: some View {
           NavigationView {
               VStack {
                   // Top Bar
                   HStack {
                       Text("EcoVenture")
                           .font(.title)
                           .fontWeight(.bold)
                           .foregroundColor(.black)

                       Spacer()

                       Image(systemName: "magnifyingglass")
                           .foregroundColor(.black)
                           .onTapGesture {
                               // Add search functionality
                           }
                   }
                   .padding()
                   .background(Color.gray.opacity(0.2))
                   .cornerRadius(10)
                   .padding()

                   // Filter Bar
                   Picker("Filter by Etat", selection: $selectedEtat) {
                       Text("All").tag("All")
                       Text("Paid").tag("paid")
                       Text("Completed").tag("completed")
                       Text("Canceled").tag("canceled")
                   }
                   .pickerStyle(SegmentedPickerStyle())
                   .padding()

                   // Hotel List
                   ScrollView {
                       ForEach(imageInfoList.filter { selectedEtat == "All" ? true : $0.etat == selectedEtat }) { imageInfo in
                           HotelItemView(imageInfo: imageInfo)
                       }
                   }
               }
               .navigationBarHidden(true)
           }
       }
   }

   struct HotelItemView: View {
       var imageInfo: ImageInfoss

       var body: some View {
           VStack {
               ZStack(alignment: .topTrailing) {
                   Image(imageInfo.imageName)
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 300, height: 200)
                       .cornerRadius(8)

                   Text(imageInfo.etat)
                       .padding(8)
                       .background(Color.blue)
                       .foregroundColor(.white)
                       .cornerRadius(8)
               }
               .overlay(
                   RoundedRectangle(cornerRadius: 8)
                       .stroke(Color.blue, lineWidth: 1)
               )
               .padding()
               .background(Color.gray.opacity(0.2))
               .cornerRadius(10)
               .padding()

               VStack(alignment: .leading, spacing: 9) {
                   Text(imageInfo.title)
                       .font(.headline)
                       .padding()

                   Text(imageInfo.location)
                       .foregroundColor(.gray)
                       .padding()

                   Text(imageInfo.price)
                       .foregroundColor(.green)
                       .padding()


                   HStack {
                       Spacer()

                       if imageInfo.etat == "paid" {
                           PaidHotelDetailsView(imageInfo: imageInfo)
                       }
                       }
                   }
               }
               .padding()
           }
       }
   

   struct PaidHotelDetailsView: View {
       var imageInfo: ImageInfoss

       var body: some View {
           VStack {
               HStack {
                   CancelBookingButton(imageInfo: imageInfo)

                   Spacer()

                   Button(action: {
                       // Add View Ticket action
                   }) {
                       Text("View Ticket")
                           .foregroundColor(.white)
                           .padding()
                           .background(Color.blue)
                           .cornerRadius(8)
                   }
               }
           }
       }
   }

   struct CancelBookingButton: View {
       var imageInfo: ImageInfoss
       @State private var isCancelAlertPresented: Bool = false

       var body: some View {
           Button(action: {
               // Show alert on cancel button click
               isCancelAlertPresented = true
           }) {
               Text("Cancel Booking")
                   .foregroundColor(.white)
                   .padding()
                   .background(Color.blue)
                   .cornerRadius(8)
           }
           .alert(isPresented: $isCancelAlertPresented) {
               Alert(
                   title: Text("Cancel Booking"),
                   message: Text("Are you sure you want to cancel this booking?"),
                   primaryButton: .destructive(Text("Yes")) {
                       // Handle cancel booking action
                       isCancelAlertPresented = false
                   },
                   secondaryButton: .cancel(Text("No")) {
                       isCancelAlertPresented = false
                   }
               )
           }
       }
   }


    

       struct HotelListView_Previews: PreviewProvider {
           static var previews: some View {
               PccMH()
           }
       }
