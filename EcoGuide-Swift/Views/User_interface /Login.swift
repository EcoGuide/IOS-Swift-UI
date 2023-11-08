//
//  Login.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-07.
//

import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            
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
                    
                    TextField("Email", text: $email)
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
                        let authService = AuthService()  // Assurez-vous que cette classe existe et contient la fonction signIn
                        authService.signInadmin(email: self.email, password: self.password) { result in
                            DispatchQueue.main.async {
                                switch result {
                                case .success(let token):
                                    print("Logged in successfully, token: \(token)")
                                    self.showingAlert = true
                                    // Vous pouvez maintenant utiliser le token comme nécessaire
                                case .failure(let error):
                                    print("An error occurred while signing in: \(error.localizedDescription)")
                                    self.showingAlert = true
                                }
                            }
                        }
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
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Authentication"),
                            message: Text("Logged in successfully. Token received."),
                            dismissButton: .default(Text("OK"))
                        )
                    }

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
    
    
}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
