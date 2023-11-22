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
        @State private var selectedHours: Int = 0
        @State private var selectedPhoneNumber: String = ""
        @State private var isForAnotherPerson = false
        @State private var totalPrice: Double = 1000
        @State private var paymentMethodParams : STPPaymentMethodParams?
        @StateObject var guideViewModel: GuideViewModel
        @Binding var guide: Guide
        @State private var isActive = false
        @Binding var discountCode: Double
        @State private var selectedDateForReservation: Date = Date()
        @State private var bookedDates: [Date] = []
        @State private var disabledDates: [Date] = [] // Populate this array with the disabled dates

        public init(selectedHours: Int, guideViewModel: GuideViewModel, guide: Binding<Guide>, discountCode: Binding<Double>) {
            // Your initialization code here
            _selectedHours = State(initialValue: selectedHours)
            _guideViewModel = StateObject(wrappedValue: guideViewModel)
            _guide = guide
            _discountCode = discountCode
        }

        private func calculateTotalPrice() -> Double {
           
                let pricePerHour = guide.price // Adjust as needed
                let totalPrice = selectedHours * pricePerHour
                return Double((totalPrice))
            
        }
        
        func formatTotalPrice() -> String {
                return String(format: "$%.2f", calculateTotalPrice())
            }
        

            
        var body: some View {
            NavigationView {
                Form {
                    Section {
                            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(WheelDatePickerStyle())
                                .onAppear {
                                    // Fetch and populate disabledDates array
                                    // Example: disabledDates = [Date()] (populate with actual disabled dates)
                                }
                                .onChange(of: selectedDate, perform: { value in
                                    // Handle selected date change
                                })
                                .disabled(disabledDates.contains(selectedDate))
                        }
                    Section(header: Text("Select Hours")) {
                        TextField("Number of Hours", text: Binding(
                            get: { "\(selectedHours)" },
                            set: { newValue in
                                if let intValue = Int(newValue) {
                                    selectedHours = intValue
                                }
                            }
                        ))
                        .keyboardType(.numberPad)
                    }


            

                    Section(header: Text("Total Price")) {
                        Text(formatTotalPrice())
                            .foregroundColor(.blue)
                    }

                    Section(header: Text("Is this booking for you?")) {
                        Toggle("For Me", isOn: $isForAnotherPerson)
                    }

                    Section {
                        if isForAnotherPerson {
                            NavigationLink(
                                destination: SelectCardsView(
                                    totalPrice: $totalPrice,
                                    user: $user,
                                    selectedPhoneNumber: $selectedPhoneNumber,
                                    discountCode: $discountCode,
                                    guide: $guide,
                                    guideViewModel: guideViewModel,
                                    selectedHours: $selectedHours, selectedDate: $selectedDateForReservation
                                )
                            ) {
                                ContinueButton("Continue") {
                                    isForAnotherPerson = true
                                }
                            }
                        } else {
                            NavigationLink(
                                destination: PaymentDetailsView(user: $user, selectedPhoneNumber: $selectedPhoneNumber, discountCode: $discountCode, guide: $guide, totalPrice: $totalPrice, selectedHours: $selectedHours, guideViewModel: guideViewModel,selectedDate: $selectedDateForReservation)
                            ) {
                                ContinueButton("Continue") {
                                    isForAnotherPerson = false
                                }
                            }
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
    @Binding var selectedHours: Int
    @StateObject var guideViewModel: GuideViewModel
    @Binding var selectedDate: Date
    
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
                NavigationLink(destination: SelectCardsView(totalPrice: $totalPrice, user: $user, selectedPhoneNumber: $selectedPhoneNumber, discountCode: $discountCode, guide: $guide, guideViewModel: guideViewModel, selectedHours: $selectedHours,selectedDate: $selectedDate )) {
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
    @StateObject var guideViewModel: GuideViewModel
    @State private var fullName = ""
    @State private var cardNumber = ""
    @State private var date = Date()
    @State private var cvv = ""
    @State private var showAlert = false
    @State private var isActive = false
    @State private var showChatView = false
    @Binding var selectedHours: Int
    @State private var paymentMethodParams: STPPaymentMethodParams?
    @State private var message: String = ""
    @State private var clientSecret: String?
    @Binding var selectedDate: Date
    
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
                     
                       
                        Section {
                            STPPaymentCardTextField.Representable.init(paymentMethodParams : $paymentMethodParams)
                        }
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
                      //  pay()
                        let userId = "655aa08d78adce5f7b9a9159"
                        guideViewModel.addGuideReservation(guideId: guide._id, userId:userId, hoursBooked:selectedHours, location:guide.location, bookedDates: [selectedDate])
                        
                        
                    }
                }
            }) {
                Text("Book Now")
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
        }.padding(20).navigationTitle("Payment method")
       
       
           
        
    }
    
}
        


    


    struct BookingGuide_Previews: PreviewProvider {
        // Use constant bindings for the preview
        @State private static var discountCode: Double = 0.0
        @State private static var selectedHours: Int = 0
        @State private static var guide = Guide(_id: "test", fullname: "Example Guide", location:"testtttt",image: "Example Location", description: "example_image", reviews: "4.5", price: Int(25.0), discountCode: 0)
        
        static var previews: some View {
            bookingFormGuide(selectedHours: selectedHours, guideViewModel: GuideViewModel(), guide: .constant(guide), discountCode: .constant(discountCode))
        }
    }
    
