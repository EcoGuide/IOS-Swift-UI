//
//  ProfileView.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-15.
//

import SwiftUI
import LocalAuthentication

let editprofile = Editprofile()
struct ProfileView: View {
    @State private var name: String = "John"
    @State private var surname: String = "Doe"
    @State private var phoneNumber: String = "(123) 456-7890"
    @State private var email: String = "john.doe@example.com"
    @State private var isEditing: Bool = false
    @State private var showMenu: Bool = false
    @State private var showingAlert = false

    // action for navigation
    @State private var navigateToLogin = false
    @State private var isLouggedout = false
    //print finger
    @State private var isAuthenticated = false
    @State private var isAuthenticating = false
    @State private var isEditProfileViewPresented = false

    var body: some View {
 
        ZStack{
            
            DynamicBackgroundView()
            NavigationView {

                List {
                    
                    Section(header: Text("User Information")) {
                        HStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                            
                            VStack(alignment: .leading) {
                                Text("Emma Phillips") // User's name
                                    .font(.headline)
                                Text("Fashion Model") // User's profession
                                    .font(.subheadline)
                            }
                        }
                    }
                    
                    // Wallet and Orders section
                    Section(header: Text("Account Details")) {
                        
                        HStack {
                            Text("Phone number")
                                .font(.headline)
                                .fontWeight(.bold)
                            Spacer()
                            Text("+216 55 428 615")
                                .font(.headline)
                        }
                        HStack {
                            Text("Mail")
                                .font(.headline)
                                .fontWeight(.bold)
                            Spacer()
                            Text("fedi.benromdhan@espirt.tn")
                                .font(.headline)
                        }
                    }
                    
                    // Menu options
                    Section {
                    ProfileOptionRow(iconName: "airplane.departure", optionName: "Favorites destinations") {

                    }
                    ProfileOptionRow(iconName: "creditcard.fill", optionName: "Payment") {
                                               // Action for Payment
                                           }
                    ProfileOptionRow(iconName: "person.2.fill", optionName: "Edit your Profile") {
                    authenticateUser()

                    }
                    ProfileOptionRow(iconName: "tag.fill", optionName: "Promotions") {
                                               // Action for Promotions
                    }
                    ProfileOptionRow(iconName: "gearshape.fill", optionName: "Settings") {
                                               // Action for Settings
                    }
                }
                    .sheet(isPresented: $navigateToLogin) {
                         EditProfileView(isEditing: $isEditing, name: $name, surname: $surname, phoneNumber: $phoneNumber, email: $email)
                    }
 
                     Section {
                         Button("Log out") {
                             showingAlert = true
                             }
                             .foregroundColor(.red)
                             .background(
                                 NavigationLink("", destination: Login(), isActive: $isLouggedout)
                                     .opacity(0)
                                     .disabled(true)
                              )
                         }

                     .alert(isPresented: $showingAlert) {
                         Alert(
                             title: Text("Loggout"),
                             message: Text("Are you sur you want to Log Out!."),
                             primaryButton: .default(Text("Yes")) {
                                 let token = UserDefaults.standard.string(forKey: "tokenAuth") ?? ""
                                 if !token.isEmpty {
                                     editprofile.logoutUser(token: token)
                                     UserDefaults.standard.removeObject(forKey: "tokenAuth")
                                     self.showingAlert = true
                                     isLouggedout = true
                                 }
                             },
                             secondaryButton: .cancel()
                         )
                     }
                   
                 
                }
              
            }
        }
        .navigationBarBackButtonHidden(true)// pas de retour (back)

    }
    // empreint authenticate
    private func authenticateUser() {
        isAuthenticating = true
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to access this feature"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                           DispatchQueue.main.async {
                               if success {
                                   isEditProfileViewPresented = true
                                   self.navigateToLogin.toggle()

                               } else {
                                   // L'authentification a échoué
                               }
                           }
                       }
        } else {
            // Gérer le cas où Touch ID/Face ID n'est pas disponible ou configuré
            isAuthenticating = false
        }
    }
    
}
struct ProfileOptionRow: View {
    var iconName: String
    var optionName: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.blue)
                    .imageScale(.large)
                Text(optionName)
                    .foregroundColor(.black)
            }
        }
    }
}
struct DynamicBackgroundView: View {
    var body: some View {
         LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
struct EditProfileView: View {
    @Binding var isEditing: Bool
    @Binding var name: String
    @Binding var surname: String
    @Binding var phoneNumber: String
    @Binding var email: String
    @State private var showingAlert = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $name)
                    TextField("Last Name", text: $surname)
                    TextField("Phone Number", text: $phoneNumber)
                    TextField("Email", text: $email)
                }
                
                Section {
                    Button("Save Changes") {
                        editprofile.Editprofile(email:self.email,password: self.surname,name: self.name) { success, responseMessage in
                            DispatchQueue.main.async {
                                self.showingAlert = true
                            }
                            isEditing = false
                        }
                    }
                }
                .alert(isPresented: $showingAlert) {
                    
                    Alert(
                        title: Text("Succes"),
                        message: Text("You are Successfully reseted your password"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .navigationBarTitle(Text("Edit Profile"), displayMode: .inline)
                .navigationBarItems(trailing: Button("Done") {
                    isEditing = false
                })
            }
        }
    }
   
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}
