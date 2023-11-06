//
//  BookingGuide.swift
//  EcoGuide
//
//  Created by Torkhani fara on 5/11/2023.
//

import SwiftUI
struct User {
    var title: String = "Mr"
    var fullName: String = ""
    var nickname: String = ""
    var dateOfBirth: Date = Date()
    var email: String = ""
    var phoneNumber: String = ""
    var discountCode: Double = 0.0
}


struct bookingformGuide: View {
    @State private var selectedDate: Date = Date()
    @State private var user = User()
    @State private var selectedHours: String = ""
    @State private var selectedPhoneNumber: String = ""
    @State private var isPaymentMethodSelected: Bool = false
    @Binding var discountCode: Double

        var body: some View {
            NavigationView {
                Form {
                    Section {
                        DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    }
                    
                    Section(header: Text("Select Hours")) {
                        TextField("Number of Hours", text: $selectedHours)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("Total Price")) {
                        Text(calculateTotalPrice())
                            .foregroundColor(.blue)
                    }
                    
                    Section {
                        NavigationLink(destination: PaymentDetailsView(user:$user, selectedPhoneNumber: $selectedPhoneNumber,
                                                discountCode : $discountCode
                                                                      )) {
                            Text("Continue")
                                .frame(maxWidth: .infinity)
                                .frame(height: 44)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .navigationBarTitle("Booking Guide")
            }
        }
        
        func calculateTotalPrice() -> String {
        
            if let hours = Int(selectedHours) {
                let pricePerHour = 50 // Adjust as needed
                let totalPrice = hours * pricePerHour
                return "$\(totalPrice)"
            } else {
                return "$0" // Handle invalid input
            }
        }
    }

struct PaymentDetailsView: View {
    @Binding var user: User
    @Binding var selectedPhoneNumber: String
    @Binding var discountCode: Double

    // Add an accessible initializer
    init(user: Binding<User>, selectedPhoneNumber: Binding<String>, discountCode: Binding<Double>) {
        _user = user
        _selectedPhoneNumber = selectedPhoneNumber
        _discountCode = discountCode
    }

    var body: some View {
        Form {
            Section(header: Text("Booking Details")) {
                Picker("Gender", selection: $user.title) {
                    Text("Mr").tag("Mr")
                    Text("Mrs").tag("Mrs")
                    Text("Ms").tag("Ms")
                    Text("Other").tag("other")
                }

                TextField("Full Name", text: $user.fullName)
                TextField("Nickname", text: $user.nickname)
                DatePicker("Date of birth", selection: $user.dateOfBirth, displayedComponents: .date)
                TextField("Email", text: $user.email)
                TextField("Phone Number", text: $selectedPhoneNumber)
                    .onChange(of: selectedPhoneNumber) { newValue in
                        user.phoneNumber = newValue
                    }
            }

            Section {
                NavigationLink(destination: SelectCardsView(user: $user, selectedPhoneNumber: $selectedPhoneNumber, discountCode: $discountCode)) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .navigationBarTitle("Name of Booking")
    }
}
    
struct SelectCardsView: View {
    @Binding var user: User
    @Binding var selectedPhoneNumber: String
    @Binding var discountCode: Double
    
    var body: some View {
        VStack(alignment : .leading,spacing:20){
           
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity) // Make the field wider
                
                HStack {
                    Image("paypal")
                        .font(.system(size: 24))
                        .padding(.leading, 16)
                
                        Text("Email: example@example.com")
                            .padding(.trailing, 16)
                        
                    
                    Spacer()
                }
            }
            
            
            
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity) // Make the field wider
                
                HStack (spacing: 20){
                        Image("mastercard")
                            .font(.system(size: 24))
                        
                        
                        VStack(alignment: .leading,spacing:15){
                            Text("*****35322565")
                                .padding(.trailing, 16)
                            
                            Text("Email: express on 21")
                                .foregroundColor(.gray)
                                .padding(.bottom, 16)
                        }
                        
                        
                    }.padding()
                
                    
                
            }
            Button(action: {
                // Handle the action when the button is tapped
            }) {
                Text("Add Card +")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.blue.opacity(0.25)) // Light blue background with opacity
                    .foregroundColor(Color.blue) // Blue text color
                    .cornerRadius(20)
            }
           
                Text("Other methods")
                    .font(.system(size: 16, weight: .semibold))
            
            
            
            ZStack (alignment: .leading){
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity) // Make the field wider
                
                HStack (spacing:20){
                    Image("cash")
                        .font(.system(size: 24))
                        .padding(16)
                    VStack(alignment: .leading,spacing:15){
                        Text("Cash Payment")
                            .padding(.trailing, 16)
                       
                        Text("default method")
                            .foregroundColor(.gray)
                            .padding(.bottom, 16)
                    }
                   

                }.padding()
                
                
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.gray.opacity(0.15))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 130)
                    .frame(maxWidth: .infinity) // Make the field wider
                
               
                VStack{
                    HStack{
                        Text("Basket Total")
                            .foregroundColor(.gray)
                           Spacer()
                        Text("+ TND 32.00")
                            .foregroundColor(.gray)
                         
                    }
                        Divider()
                            
                    HStack{
                        Text("Discount ")
                            .foregroundColor(.gray)
                           Spacer()
                        Text("- TND 32.00")
                            .foregroundColor(.blue)
                        
                    }
                    
                    Divider()
                    HStack{
                        Text(" Total")
                            .foregroundColor(.gray)
                           Spacer()
                        Text(" TND 32.00")
                            .foregroundColor(.gray)
                        
                    }
                    
                
                    
                }.padding()

                
               
              
                
            }
            
            Section {
                NavigationLink(destination: SelectCardsView(user: $user, selectedPhoneNumber: $selectedPhoneNumber, discountCode: $discountCode)) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }}
        }.padding(20).navigationTitle("Payment method")
       
       
           
        
    }
    
}
        
    

enum PaymentMethod: String, Equatable, CaseIterable {
    case creditCard = "Credit Card"
    case cash = "Cash"
    case amen = "Amen"
}
    
struct BookingGuide_Previews: PreviewProvider {
    @State private static var discountCode: Double = 0.0
    static var previews: some View {
        bookingformGuide(discountCode: $discountCode)
    }
}

    

