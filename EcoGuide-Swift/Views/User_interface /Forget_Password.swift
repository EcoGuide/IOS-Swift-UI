//
//  Forget_Password.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-08.
//

import SwiftUI

struct Forget_Password: View {
    @State private var email: String = ""
    @State private var showingAlert = false
       var body: some View {
           VStack {
               Spacer()
               
               // Icon Placeholder
               Image(systemName: "person.and.background.dotted")
                   .resizable()
                   .aspectRatio(contentMode: .fill)
                   .frame(width: 200, height: 200)
                   .foregroundColor(.blue)
               Spacer()
               // Title Text
               Text("Forget Password ?")
                   .font(.largeTitle)
                   .fontWeight(.semibold)
               
               // Description Text
               Text("Enter your email associated with your account")
                   .font(.body)
                   .padding(.top, 4)
               
               Text("We will email you a code to reset your password")
                   .font(.footnote)
                   .foregroundColor(.gray)
                   .padding(.top, 2)
               
               // Email Input Field
               TextField("Email", text: $email)
                   .padding()
                   .background(Color(.systemGray6))
                   .cornerRadius(10)
                   .padding(.horizontal)
                   .keyboardType(.emailAddress)
                   .autocapitalization(.none)
               
               // Send Email Button
               Button(action: {
                   self.showingAlert = true
                   // Send email logic goes here
               }) {
                   Text("Send Email")
                       .foregroundColor(.white)
                       .padding()
                       .frame(maxWidth: .infinity)
                       .background(Color.blue)
                       .cornerRadius(10)
                       .padding(.horizontal)
               }
               .padding(.top, 20)
               .shadow(color: .black, radius: 70, x: 1, y: 30)
               .alert(isPresented: $showingAlert) {
                   
                          Alert(
                              title: Text("Code has been sent  "),
                              message: Text("Thank you for checking your Mail to get your verification Code."),
                              dismissButton: .default(Text("OK"))
                           )
                      }
               Spacer()
           }
           .padding()
       }
   }

 

struct Forget_Password_Previews: PreviewProvider {
    static var previews: some View {
        Forget_Password()
    }
}
