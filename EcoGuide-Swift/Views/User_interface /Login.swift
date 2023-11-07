//
//  Login.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-07.
//

import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
           ZStack {
               // Fond d'écran
               Image("background")
                   .resizable()
                   .edgesIgnoringSafeArea(.all)
               
               VStack {
                   
                   Text("Sign In")
                       .foregroundColor(.white)
                   Spacer()

                   Text(" ")
                       .font(.largeTitle)
                       .fontWeight(.semibold)
                       .foregroundColor(.white)
                       .padding(.bottom, 50)

                   TextField("Email", text: $username)
                       .padding(.vertical)
                       .padding(.leading, 35)
                       .background(Color.white.opacity(0.6))
                       .cornerRadius(20)
                       .padding(.horizontal, 32)
                       .frame(minWidth: 0, maxWidth: .infinity)

                       .overlay(
                           HStack {
                               Image(systemName: "envelope")
                                   .foregroundColor(.gray)
                                   .padding(.leading, 10)
                               Spacer()
                           }
                           .padding(.leading, 35), // Cette valeur doit correspondre au padding horizontal de votre TextField
                           alignment: .leading
                       )

                   SecureField("Password", text: $password)
                       .padding(.vertical)
                       .padding(.leading, 35)
                       .background(Color.white.opacity(0.7))
                       .cornerRadius(20)
                       .padding(.horizontal, 32)
                       .padding(.top, 10)
                       .frame(minWidth: 0, maxWidth: .infinity) // Assure la largeur maximale disponible

                       .overlay(
                           HStack {
                               Image(systemName: "lock")
                                   .foregroundColor(.gray)
                                   .padding(.leading, 15)
                               Spacer()
                           }
                           .padding(.leading, 35), // Cette valeur doit correspondre au padding horizontal de votre SecureField
                           alignment: .leading
                       )


                   Button(action: {
                       // Logique de connexion
                   }) {
                       Text("Sign In")
                           .fontWeight(.bold)
                           .foregroundColor(.white)
                           .frame(minWidth: 0, maxWidth: .infinity)
                           .padding()
                           .background(Color.blue)
                           .cornerRadius(20)
                           .padding(.horizontal, 32)
                   }
                   .padding(.top, 20)
                   .shadow(color: .black, radius: 70, x: 1, y: 30)

                   Button(action: {
                       // Logique pour oublier le mot de passe
                   }) {
                       Text("Forget password? Click Here")
                           .fontWeight(.bold)
                           .foregroundColor(.white)
                           .font(.caption)
                   }
                   .padding(.top, 5)
                   
                    Text("OR")
                       .foregroundColor(.white)
                       .padding(.top, 10)
                    HStack(spacing: 8) {
                       Button(action: {
                           // Logique de connexion Facebook
                       }) {
                           Image(systemName: "f.circle.fill")
                               .font(.system(size:30))
                               .foregroundColor(.white)
                               .padding(.vertical, 8)
                        }
                       Button(action: {
                           // Logique de connexion apple
                       }) {
                           Image(systemName: "applelogo")
                               .font(.system(size:30))
                               .foregroundColor(.white)
                               .padding(.vertical, 8)
                        }
                   }
                    Spacer(minLength: 5)
               }
           }
           .edgesIgnoringSafeArea(.bottom)
       }
   }






struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
