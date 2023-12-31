//
//  Register.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-07.
//

import SwiftUI

struct Register: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        ZStack {
            // Fond d'écran
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Sign Up")
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
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        .padding(.leading, 35), // Cette valeur doit correspondre au padding horizontal de votre TextField
                        alignment: .leading
                    )
                TextField("Firstname", text: $username)
                    .padding(.vertical)
                    .padding(.leading, 35)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(20)
                    .padding(.horizontal, 32)
                    .frame(minWidth: 0, maxWidth: .infinity)

                    .overlay(
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        .padding(.leading, 35), // Cette valeur doit correspondre au padding horizontal de votre TextField
                        alignment: .leading
                    )
                
                TextField("Phone", text: $username)
                    .padding(.vertical)
                    .padding(.leading, 35)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(20)
                    .padding(.horizontal, 32)
                    .frame(minWidth: 0, maxWidth: .infinity)

                    .overlay(
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.black)
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
                            Image(systemName: "lock.fill")
                                .foregroundColor(.black)
                                .padding(.leading, 15)
                            Spacer()
                        }
                        .padding(.leading, 35), // Cette valeur doit correspondre au padding horizontal de votre SecureField
                        alignment: .leading
                    )


                Button(action: {
                    // Logique de connexion
                }) {
                    Text("Sign Up")
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
                    Text("Already have an Account? Sign In")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.caption)
                }
                 HStack(spacing: 8) {
                                   Button(action: {
                                       // Logique de connexion Facebook
                                   }) {
                                       VStack{
                                           Image(systemName: "f.circle.fill")
                                               .font(.system(size:30))
                                               .foregroundColor(.white)
                                               .padding(.vertical, 8)
                                           Text("facebook")
                                                         .font(.caption)
                                                         .foregroundColor(.white)
                                           
                                       }
                                       
                                   }
                                   Button(action: {
                                       // Logique de connexion apple
                                   }) {
                                       VStack{
                                           Image(systemName: "applelogo")
                                               .font(.system(size:30))
                                               .foregroundColor(.white)
                                               .padding(.vertical, 8)
                                           Text("Apple")
                                                         .font(.caption)
                                                         .foregroundColor(.white)
                                       }}
                                }
                
                
             }
        }
     }
}

// Vue personnalisée pour le contenu des boutons de connexion
struct SignInButtonContent: View {
    var text: String
    var imageName: String
    var backgroundColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.white)
            Text(text)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(20)
    }
}

     
 

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
