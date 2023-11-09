//
//  WelcomeMsgActivities.swift
//  EcoGuide-Swift
//
//  Created by Copper_Orka on 8/11/2023.
//

import SwiftUI





struct WelcomeMsgActivities: View {
    var body: some View {
        ZStack{
            Image("man")
                .resizable()
                .frame(width: 600, height: 900)
                .clipped()
                .edgesIgnoringSafeArea(.all)
            
            ZStack{
               Image("white")
                    .opacity(0.9)
                   
                
                
            }
            VStack{
                Spacer()
                ZStack{
                    Text("hello")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                        .padding(.horizontal, 32)
                }
            }
        }
    }
}




struct WelcomeMsgActivities_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeMsgActivities()
        }
    }
