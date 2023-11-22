//
//  ContentChatView.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 7/11/2023.
//

import SwiftUI

struct ContentChatView: View {
    @StateObject var messageManager = MessageManager()

    var body: some View {
        VStack {
            VStack {
                TitleRow()

                ScrollView {
                    ScrollViewReader { proxy in
                        LazyVStack {
                            ForEach(messageManager.messages, id: \.id) { message in
                                MessageBubbleGuide(message: message)
                            }
                        }
                        .onChange(of: messageManager.lastMessageId) { id in
                            withAnimation {
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            .padding(.top, 10)
            .background(Color.white)
            .cornerRadius(3)
        }
        .background(Color.blue.opacity(0.25))

        MessageGuideField().environmentObject(messageManager)
    }
}
    
    struct ContentChatView_Previews: PreviewProvider {
        static var previews: some View {
            ContentChatView()
        }
    }
    
