//
//  MessageBubbleGuide.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 7/11/2023.
//

import SwiftUI

struct MessageBubbleGuide: View {
    var message: Message
    @State private var showTime = false
    var body: some View {
        VStack(alignment: message.recieved ? .leading : .trailing){
            HStack{
                Text(message.text).padding().background(message.recieved ? Color.gray.opacity(0.25) : Color.blue.opacity(0.25)).cornerRadius(20)
            }.frame(maxWidth: 300,alignment: message.recieved ? .leading : .trailing)
            
                .onTapGesture {
                    showTime.toggle()
                }
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))").font(.caption2).foregroundColor(.gray).padding(message.recieved ? .leading : .trailing, 25)
            }

            
        }.frame(maxWidth: .infinity , alignment: message.recieved ? .leading : .trailing).padding(message.recieved ? .leading : .trailing).padding(.horizontal,10)
    }
}

struct MessageBubbleGuide_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubbleGuide(message: Message(id: "12345",text: "I've been coding SwiftUi applications from scratch ", recieved: false,timestamp: Date()))
    }
}
