//
//  TabBar.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 8/11/2023.
//

import SwiftUI

struct TabBar: View {
    @State var index = 0
    
    var body: some View {
        VStack{
            Spacer()
            
            CircleTab()
            
        }.background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
struct CircleTab : View {
@State var index = 0
    var body: some View {
        
        HStack{
            Button(action: {
                self.index = 0
            }){
                VStack{
                    
                    if self.index != 0{
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width:23, height: 23)
                            .foregroundColor(Color.blue)
                    }
                    else{
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width:23, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(y: -20)
                            .padding(.bottom,-20)
                        Text("Home").foregroundColor(.gray)
                    }
                }
            }
            Spacer(minLength: 15)
            Button(action: {
                self.index = 1
            }){
                VStack{
                    
                    if self.index != 1{
                        Image(systemName: "figure.walk.motion")
                            .resizable()
                            .frame(width:23, height: 23)
                            .foregroundColor(Color.blue)
                    }
                    else{
                        Image(systemName: "figure.walk.motion")
                            .resizable()
                            .frame(width:23, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(y: -20)
                            .padding(.bottom,-20)
                        Text("Activity").foregroundColor(.gray)
                    }
                }
               
            }
            Spacer(minLength: 15)
            Button(action: {
                self.index = 2
            }){
                VStack{
                    
                    if self.index != 2{
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width:23, height: 23)
                            .foregroundColor(Color.blue)
                    }
                    else{
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width:23, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(y: -20)
                            .padding(.bottom,-20)
                        Text("Guid").foregroundColor(.gray)
                    }
                }
               
            }
            Spacer(minLength: 15)
            Button(action: {
                self.index = 3
            }){
                VStack{
                    
                    if self.index != 3{
                        Image(systemName: "car.fill")
                            .resizable()
                            .frame(width:23, height: 20)
                            .foregroundColor(Color.blue)
                        
                    }
                    else{
                        Image(systemName: "car.fill")
                            .resizable()
                            .frame(width:23, height: 20)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(y: -20)
                            .padding(.bottom,-20)
                        Text("Transport").foregroundColor(.gray)
                    }
                }
               
            }
            
            Spacer(minLength: 15)
            Button(action: {
                self.index = 4
            }){
                VStack{
                    
                    if self.index != 4{
                        Image(systemName: "bookmark.fill")
                            .resizable()
                            .frame(width:20, height: 26)
                            .foregroundColor(Color.blue)
                    }
                    else{
                        Image(systemName: "bookmark.fill")
                            .resizable()
                            .frame(width:20, height: 26)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(y: -20)
                            .padding(.bottom,-20)
                        Text("Bookmark").foregroundColor(.gray)
                    }
                }
               
            }
        }.padding(.vertical,-10)
            .padding(.horizontal,25)
            .background(Color.white)
    }
}
