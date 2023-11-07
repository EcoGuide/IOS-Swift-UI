//
//  ContentChatView.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 7/11/2023.
//

import SwiftUI

struct ContentChatView: View {
    var messageArray = ["Hello you", "How are you doing" , "Ive been  building SwiftUi applications from scratch and its so much fun "]
    var messageArray1 = ["Hi  ", "I'm doing great Thanks for asking","That's good" ,"Glad to hear about it","Do you have any recommendations to learn ?"]
    var body: some View {
        VStack{
            
       
        VStack{
            TitleRow()
            ScrollView {
                LazyVStack {
                    ForEach(messageArray, id: \.self) { text in
                        MessageBubbleGuide(message: Message(id: "12345", text: text, recieved: true, timestamp: Date()))
                    }
                }
                
                ScrollView {
                    LazyVStack {
                        ForEach(messageArray1, id: \.self) { text in
                            MessageBubbleGuide(message: Message(id: "12345", text: text, recieved: false, timestamp: Date()))
                        }
                    }}
            }.padding(.top,10).background(.white)
                .cornerRadius(3)
            
        }.background(Color.blue.opacity(0.25))
            
            MessageGuideField()
    }
    }

    
    struct ContentChatView_Previews: PreviewProvider {
        static var previews: some View {
            ContentChatView()
        }
    }
}
