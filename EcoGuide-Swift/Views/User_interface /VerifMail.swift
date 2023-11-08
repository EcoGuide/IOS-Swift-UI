//
//  VerifMail.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-07.
//

import SwiftUI

struct VerifMail: View {
    var body: some View {
    
        ZStack{
          
 

            ZStack {
                // Fond d'écran
                 
                 
            }
            VStack {
//                Text("Mail Verification")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//                      .padding(.top, 8)
                Image(systemName: "person.crop.circle.fill.badge.checkmark")
                                .resizable()
                            .aspectRatio(contentMode: .fit)
                               .frame(width: 220, height: 270)
                              .foregroundColor(Color.blue)
                             Spacer()
                Text("We should verify your Email")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
              
 
                Button(action: {
                    // Logique de connexion
                }) {
                    Text("Verify Mail")
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
                Spacer()
 
            }
        }
    }
    
}
//    var body: some View {
//            VStack {
//                Text("Mail Verification")
//                    .font(.largeTitle)
//                    .fontWeight(.semibold)
//                    .padding(.top)
//
//                Spacer()
//
//                // The checkmark circle
//                Image(systemName: "checkmark.circle.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 720, height: 270)
//                    .foregroundColor(Color.blue)
//                Spacer()
//                Text("We should verify your Email")
//                    .font(.headline)
//                    .foregroundColor(.secondary)
//                    .padding(.top, 8)
//
//                Spacer()
//
//                // Verify button
//                Button(action: {
//                    // Logique de connexion
//
//                }) {
//                    Text("Explore")
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .frame(minWidth: 0, maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(20)
//                        .padding(.horizontal, 32)
//                }
//                .padding(.top, 20)
//                .shadow(color: .black, radius: 70, x: 1, y: 30)
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color(.systemGray6)) // Use an appropriate system color for background
//            .edgesIgnoringSafeArea(.all)
//        }
//    }
//

struct VerifMail_Previews: PreviewProvider {
    static var previews: some View {
        VerifMail()
    }
}
