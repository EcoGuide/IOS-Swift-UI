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
                .scaledToFill() // Use scaledToFill to cover the entire screen
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .clipped()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer() // Push the following VStack to the bottom of the screen
                VStack{
                    Text("Pack Your Bags")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Chase Your Dreams")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(100) // Add padding to the VStack to create the gray transparent background
                .background(Color.gray.opacity(0.5)) // Set the background color with transparency
            }
        }
    }
}



/*

struct WelcomeMsgActivities: View {
    var body: some View {
        ZStack{
            Image("man")
                .resizable()
                .frame(width: 600, height: 900)
                .clipped()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Pack Your Bags")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 600, height: 50)
                        
                Text("Chase Your Dreams")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                   
                
            }
        }
    }
}*/




struct WelcomeMsgActivities_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeMsgActivities()
        }
    }
