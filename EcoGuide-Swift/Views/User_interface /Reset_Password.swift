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

      var body: some View {
          VStack {
              // Title
              Text("Forgot Password")
                  .font(.title)
                  .fontWeight(.bold)
                  .padding()

              Image(systemName: "person.crop.circle.badge.exclamationmark")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(height: 150)
                  .foregroundColor(.blue)
                  .padding()

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
              .shadow(color: .black, radius: 75, x: 1, y: 30)
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
