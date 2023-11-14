//
//  Reset_Password.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-08.
//

import SwiftUI

struct Reset_Password: View {
    @State private var newPassword = ""
      @State private var confirmPassword = ""
      @State private var rememberMe = false
    @State private var navigatingToResetPassword = false

      var body: some View {
//          NavigationView {
//                     VStack {
//
//
//                         Button("Send Code") {
//                             // Ici, vous pouvez appeler votre fonction pour envoyer le code
//                             // Si le code est envoyé avec succès, vous pouvez activer la navigation
//                             self.navigatingToResetPassword = true
//                         }
//
//                         // Ceci est le lien de navigation qui est activé lorsque `navigatingToResetPassword` est vrai
//                         NavigationLink(destination: Reset_Password(), isActive: $navigatingToResetPassword) {
//                             EmptyView()
//                         }
//                     }
//                     .navigationBarTitle("Forget Password?")
//                 }
          VStack {
              // Title
             

              Image(systemName: "person.badge.shield.checkmark.fill")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(height: 150)
                  .foregroundColor(.blue)
                  .padding()
                  .opacity(0.4)
              Text("Resest  your Password")
                  .font(.title)
                  .fontWeight(.bold)
                  .padding()
                  .opacity(0.7)

              VStack(spacing: 15) {
                  SecureField("Create Your New Password", text: $newPassword)
                      .padding()
                      .background(Color(.systemGray6))
                      .cornerRadius(10)

                  SecureField("Confirm Your New Password", text: $confirmPassword)
                      .padding()
                      .background(Color(.systemGray6))
                      .cornerRadius(10)
              }
              .padding()

              Toggle(isOn: $rememberMe) {
                  Text("Remember Me")
              }
              .padding()
              .foregroundColor(.blue)


              // Reset Password Button
              Button(action: {
                  // Logic to reset password
                  // consomation api node  /reset-password
              }) {
                  Text("Reset Password")
                      .foregroundColor(.white)
                      .frame(maxWidth: .infinity)
                      .padding()
                      .background(Color.blue)
                      .cornerRadius(10)
              }
              .padding(.horizontal)
              .shadow(color: .black, radius: 95, x: 1, y: 40)
              Spacer()
          }
          .padding()
      }
  }

struct Reset_Password_Previews: PreviewProvider {
    static var previews: some View {
        Reset_Password()
    }
}
