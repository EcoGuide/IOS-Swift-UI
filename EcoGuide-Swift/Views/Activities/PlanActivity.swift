//
//  PlanActivity.swift
//  EcoGuide-Swift
//
//  Created by Copper_Orka on 9/11/2023.
//

import SwiftUI

struct PlanActivity: View {
    @State private var progress: Double = 0.2
    @State private var isPressed = false
    
    

    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack(alignment: .leading, spacing: 10)
                    {
                        HStack{
                            Image(systemName: "arrow.left")
                                .font(.system(size: 22, weight: .semibold))
                           
                            ZStack {//progress bar
                                ProgressBar(progress: $progress, color: .gray)
                                    .frame(height: 15)
                                ProgressBar(progress: $progress, color: .blue)
                                  
                                .frame(height: 15)
                                .padding(.top, 0)
                            }.padding(15)
                            Spacer()
                         
                        }
                        HStack{
                            Text("Who is going?")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(.black))
                            Text("bag icon")
                        }
                        Text("Lets get started by selectiong your party")
                            .font(.system(size: 15))
                            .foregroundColor(Color(.gray))
                        Spacer()
                        VStack{
                            Button(action: {
                                       isPressed.toggle()
                                   }) {
                                       Text("Press Me")
                                           .foregroundColor(.black)
                                           .padding()
                                           .frame(maxWidth: .infinity)
                                           .background(Color.white)
                                           .overlay(
                                               RoundedRectangle(cornerRadius: 8)
                                                   .stroke(isPressed ? Color.blue : Color.gray, lineWidth: 2)
                                           )
                                   }
                                   .buttonStyle(PlainButtonStyle())
                            ZStack {
                                
                                      Rectangle()
                                          .stroke(Color.blue, lineWidth: 3)
                                          .frame(width: 350, height: 80)
                                          .cornerRadius(10)

                                VStack{
                                    HStack{
                                        Text("Solo")
                                            .font(.system(size: 24, weight: .bold))
                                            .foregroundColor(.black)
                                        Text("solo icon")
                                            .foregroundColor(.blue)
                                    }
                                    Text("text")
                                        .font(.title)
                                        .foregroundColor(.blue)
                                }
                                  }
                        }
                        
                        
                        
                        Spacer()
                        
                     
                        
                    }.padding(.leading, 20)
                    
                }
            }.toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {})
                    {
                        HStack {
                            //Text("Good Morning, \(Auth.currentUser?.firstname ?? "")")
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .foregroundColor(Color(.black))
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button (action: {
                        //
                    })
                    {
                        HStack {
                            Text("Activity Planner")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(.black))

                            
                            
                        }
                    }
                    .foregroundColor(Color(.blue))
                }
            }.padding(.top, 20)
            
        }
    }
}
struct PlanActivity_Previews: PreviewProvider {
    static var previews: some View {
        PlanActivity()
    }
}
