//
//  MessageGuideField.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 7/11/2023.
//

import SwiftUI

struct MessageGuideField: View {
    
    @State private var message = ""
    @EnvironmentObject var messagesManager: MessageManager
    
    var body: some View {
        HStack {
            CustomTextField(placeHolder: Text("Enter your message here"), text: $message)
            Button {
                messagesManager.sendMessage(text: message)
                message =  ""
            } label: {
                Image(systemName: "paperplane.fill").foregroundColor(.white).padding(10).background(Color.blue).cornerRadius(20)
            }
        }.padding(.horizontal)
        .padding(.vertical,10)
        .background(Color.gray.opacity(0.25)).cornerRadius(50).padding()
    }
}

struct MessageGuideField_Previews: PreviewProvider {
    static var previews: some View {
        MessageGuideField()
            .environmentObject(MessageManager())    }
}


struct CustomTextField: View{
    var placeHolder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    var body: some View {
        ZStack(alignment: .leading) {
            if (text.isEmpty){
                placeHolder.opacity(0.5)
            }
            TextField("",text:  $text,onEditingChanged: editingChanged,onCommit: commit)
        }
    }
}

                            
