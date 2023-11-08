//
//  OTP.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-08.
//

import SwiftUI

struct OTP: View {
    @State private var code = ""
       @State private var timeRemaining = 53
       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

       var body: some View {
           VStack {
               Spacer()
               
               // Title
               Text("Forgot Password")
                   .font(.title)
                   .fontWeight(.bold)
               
               // Message
               Text("Code Has Been sent to +1 111 **** 99")
                   .font(.body)
                   .foregroundColor(.gray)
                   .padding(.vertical)
               
               // Code Input Fields
               HStack(spacing: 20) {
                   ForEach(0..<4, id: \.self) { _ in
                       TextField("", text: $code)
                           .frame(width: 40, height: 45)
                           .background(Color(.systemGray6))
                           .multilineTextAlignment(.center)
                           .keyboardType(.numberPad)
                           .cornerRadius(10)
                   }
               }
               .padding()
               
               // Resend Code Timer
               if timeRemaining > 0 {
                   Text("Resend code in \(timeRemaining)s")
                       .font(.caption)
                       .foregroundColor(.blue)
                       .onReceive(timer) { _ in
                           if timeRemaining > 0 {
                               timeRemaining -= 1
                           }
                       }
               } else {
                   Button(action: {
                       // Action to resend the code
                       // Reset the timer
                       timeRemaining = 53
                   }) {
                       Text("Resend code")
                           .foregroundColor(.blue)
                   }
               }
               
               Spacer()
               
               // Verify Button
               Button(action: {
                   // Action to verify the code
               }) {
                   Text("Verify")
                       .foregroundColor(.white)
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(Color.blue)
                       .cornerRadius(10)
                       .padding(.horizontal)
               }
               .padding(.bottom)
           }
           .padding()
       }
   }

 

struct OTP_Previews: PreviewProvider {
    static var previews: some View {
        OTP()
    }
}
