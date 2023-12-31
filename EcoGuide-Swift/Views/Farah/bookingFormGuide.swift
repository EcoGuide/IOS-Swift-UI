//
//  BookingGuide.swift
//  EcoGuide
//
//  Created by Torkhani fara on 5/11/2023.
//

import SwiftUI
import Stripe
struct User {
    var title: String = "Mr"
    var fullName: String = ""
    var nickname: String = ""
    var dateOfBirth: Date = Date()
    var email: String = ""
    var phoneNumber: String = ""
    var discountCode: Double = 0.0
}

    
    struct bookingFormGuide: View {
        @State private var selectedDate: Date = Date()
        @State private var user = User()
        @State private var selectedHours: String = ""
        @State private var selectedPhoneNumber: String = ""
        @State private var isForAnotherPerson = false
        @State private var totalPrice: Double = 1000
        @State private var paymentMethodParams : STPPaymentMethodParams?
        @StateObject var guideViewModel: GuideViewModel
        @Binding var guide: Guide
        @State private var isActive = false
        @Binding var discountCode: Double
        private func calculateTotalPrice() -> Double {
            if let hours = Int(selectedHours) {
                let pricePerHour = guide.price // Adjust as needed
                let totalPrice = hours * pricePerHour
                return Double((totalPrice))
            } else {
                return 0 // Handle invalid input
            }
        }
        
        func formatTotalPrice() -> String {
                return String(format: "$%.2f", calculateTotalPrice())
            }
        

            
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
                           Text(formatTotalPrice())
                               .foregroundColor(.blue)
                       }
                       
                       Section {
                           STPPaymentCardTextField.Representable.init(paymentMethodParams : $paymentMethodParams)
                       }

                       Section(header: Text("Is this booking for you?")) {
                           Toggle("For Me", isOn: $isForAnotherPerson)
                       }

                       Section {
                           if isForAnotherPerson {
                               NavigationLink(
                                destination:SelectCardsView(totalPrice: $totalPrice, user: $user, selectedPhoneNumber: $selectedPhoneNumber, discountCode: $discountCode, guide: $guide),
                                   label: {
                                       ContinueButton("Continue") {
                                           isForAnotherPerson = true
                                       }
                                   }
                               )
                           } else {
                               NavigationLink(
                                destination: PaymentDetailsView(user: $user, selectedPhoneNumber: $selectedPhoneNumber, discountCode: $discountCode, guide: $guide, totalPrice: $totalPrice),
                                   label: {
                                       ContinueButton("Continue") {
                                           isForAnotherPerson = false
                                       }
                                   }
                               )
                           }
                       }
                   }
                   .navigationBarTitle("Booking Form", displayMode: .inline)
               }
           }

           private func ContinueButton(_ title: String, action: @escaping () -> Void) -> some View {
               Button(action: action) {
                   Text(title)
                       .frame(maxWidth: .infinity)
                       .frame(height: 44)
                       .background(Color.blue)
                       .foregroundColor(.white)
                       .cornerRadius(8)
               }
           }

           
       }
struct PaymentDetailsView: View {
    @Binding var user: User
    @Binding var selectedPhoneNumber: String
    @Binding var discountCode: Double
    @Binding var guide: Guide
    @Binding var totalPrice: Double

    // Add an accessible initializer
    init(user: Binding<User>, selectedPhoneNumber: Binding<String>, discountCode: Binding<Double>, guide: Binding<Guide>, totalPrice: Binding<Double> ) {
        _user = user
        _selectedPhoneNumber = selectedPhoneNumber
        _discountCode = discountCode
        _guide = guide
        _totalPrice = totalPrice
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
                NavigationLink(destination: SelectCardsView(totalPrice: $totalPrice, user: $user, selectedPhoneNumber: $selectedPhoneNumber, discountCode: $discountCode, guide: $guide)) {
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
    @Binding var totalPrice: Double
    @Binding var user: User
    @Binding var selectedPhoneNumber: String
    @Binding var discountCode: Double
    @Binding var guide: Guide
    
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
                
                Section {
                    NavigationLink(destination: addCardview()) {
                        Text("Add Card +")
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.blue.opacity(0.25)) // Light blue background with opacity
                            .foregroundColor(Color.blue) // Blue text color
                            .cornerRadius(20)
                    }}
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
                NavigationLink(destination: secondPaymentView(totalPrice: $totalPrice, guide: $guide)) {
                    Text("Book now")
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }}
        }.padding(20).navigationTitle("Payment method")
       
       
           
        
    }
    
}
        
struct addCardview: View {
    @State private var fullName = ""
    @State private var cardNumber = ""
    @State private var date = Date()
    @State private var cvv = ""

    var body: some View {
        Image("mastercard1")
            .font(.system(size: 24))

        VStack(alignment: .leading, spacing: 15) {
           
            Form {
                Section {
                    TextField("Full Name", text: $fullName)
                    TextField("Card Number", text: $cardNumber)
                    HStack(alignment: .center){
                       
                        TextField("Cvv", text: $cvv)
                        DatePicker("Date", selection: $date, displayedComponents: .date).padding(2)
                      
                     
                    }
                 
                                  
                                  }
                Text("Add New Card")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
            
            
            
        }
    }
}




struct secondPaymentView: View {
    @Binding var totalPrice: Double
    @State private var fullName = ""
    @State private var cardNumber = ""
    @State private var date = Date()
    @State private var cvv = ""
    @State private var showAlert = false
    @State private var isActive = false
    @State private var showChatView = false
    @State private var selectedHours: String = ""
    @Binding var guide: Guide
    @State private var paymentMethodParams: STPPaymentMethodParams?
    @State private var message: String = ""
    @State private var clientSecret: String?
    
    private func pay() {
        guard let clientSecret = PaymentConfig.shared.paymentIntentClientSecret else {
            return
        }
        
        let paymentIntentParams = STPPaymentIntentParams(clientSecret: clientSecret)
        paymentIntentParams.paymentMethodParams = paymentMethodParams
        
        // Use PaymentGatewayControllerWrapper to handle the payment
        PaymentGatewayControllerWrapper(message: $message, clientSecret: clientSecret) { status in
            switch status {
            case .failed:
                message = "Failed"
                
            case .canceled:
                message = "Cancelled"
                
            case .succeeded:
                message = "Your Payment has been successfully completed"
            }
            
        }}
    
    /*private func startCheckout(completion: @escaping (String?) -> Void) {
     let url = URL(string: "https://ecoventura-payment-server.glitch.me/create-payment-intent")!
     var request = URLRequest(url: url)
     request.httpMethod = "POST"
     request.httpBody = try! JSONEncoder().encode(calculateTotalPrice())
     request.timeoutInterval = 30 // Set a reasonable timeout interval in seconds
     
     URLSession.shared.dataTask(with: request) { data, response, error in
     DispatchQueue.main.async {
     if let error = error {
     print("Error in data task: \(error)")
     completion(nil)
     return
     }
     
     guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
     print("Invalid response or status code")
     completion(nil)
     return
     }
     
     guard let data = data else {
     print("No data in response")
     completion(nil)
     return
     }
     
     do {
     let checkoutIntentResponse = try JSONDecoder().decode(CheckoutIntentResponse.self, from: data)
     completion(checkoutIntentResponse.clientSecret)
     } catch {
     print("Error decoding JSON: \(error)")
     completion(nil)
     }
     }
     }.resume()
     }*/
    
    private func startCheckout(price: Double, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: "https://ecoventura-payment-server.glitch.me/create-payment-intent") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestData: [String: Double] = ["price": price]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestData)
        } catch {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil,
                  (response as? HTTPURLResponse)?.statusCode == 200
            else {
                completion(nil)
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let clientSecret = json["clientSecret"] as? String {
                completion(clientSecret)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    
    var body: some View {
        
        VStack(alignment : .leading,spacing:20){
            
            HStack{
                Text("Payment Methods")
                    .font(.system(size: 16, weight: .semibold))
                
                
                
                Spacer()
                
                Button("Add New Card") {
                    // Action to show the map
                }
                .foregroundColor(Color.pink)
                
                
            }.padding()
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.blue.opacity(0.1))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 400)
                    .frame(maxWidth: .infinity) // Make the field wider
                VStack(alignment: .leading,spacing:30){
                    HStack {
                        
                        Image("paypal")
                            .padding(.leading, 16)
                        Text("Paypal")
                        
                        
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            
                            Circle()
                                .stroke(Color.blue , lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                            
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width  - 50 ,height:60)
                    
                    
                        .background(Color.white).cornerRadius(20)
                    
                    
                    HStack {
                        
                        Image("paypal")
                            .padding(.leading, 16)
                        Text("Paypal")
                        
                        
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            
                            Circle()
                                .stroke(Color.blue , lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                            
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width  - 50 ,height:60)
                    
                    
                        .background(Color.white).cornerRadius(20)
                    HStack {
                        
                        Image("paypal")
                            .padding(.leading, 16)
                        Text("Paypal")
                        
                        
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            
                            Circle()
                                .stroke(Color.blue , lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                            
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width  - 50 ,height:60)
                    
                    
                        .background(Color.white).cornerRadius(20)
                    
                    Text("Pay with Debit/Credit Card")
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Image("mastercard")
                            .padding(.leading, 16)
                        Text("master card")
                        
                        
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            
                            Circle()
                                .stroke(Color.blue , lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                            
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width  - 50 ,height:60)
                    
                    
                        .background(Color.white).cornerRadius(20)
                    
                }
            }.padding()
            
            VStack {
                NavigationLink(
                    destination: ContentChatView(),
                    isActive: $showChatView,
                    label: {
                        EmptyView()
                    }
                )}
            
            Button(action: {
                showAlert = true
                startCheckout(price: totalPrice) { clientSecret in
                    PaymentConfig.shared.paymentIntentClientSecret = clientSecret
                    DispatchQueue.main.async {
                        self.isActive = true
                        pay()
                    }
                }
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(50)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Payment Successful"),
                    message: Text("Your payment has been processed."),
                    dismissButton: .default(Text("OK"), action: {
                        // After the alert is dismissed, set the flag to show the ChatView
                        showChatView = true
                    })
                )
            }
            
            
            
        }
    }
    
    
    
    
    
    
    
    enum PaymentMethod: String, Equatable, CaseIterable {
        case creditCard = "Credit Card"
        case cash = "Cash"
        case amen = "Amen"
    }
    
    struct BookingGuide_Previews: PreviewProvider {
        // Use constant bindings for the preview
        @State private static var discountCode: Double = 0.0
        @State private static var guide = Guide(_id: "test", fullname: "Example Guide", location:"testtttt",image: "Example Location", description: "example_image", reviews: "4.5", price: Int(25.0), discountCode: 0)
        
        static var previews: some View {
            bookingFormGuide(guideViewModel: GuideViewModel(), guide: .constant(guide), discountCode: .constant(discountCode))
        }
    }
    
}
