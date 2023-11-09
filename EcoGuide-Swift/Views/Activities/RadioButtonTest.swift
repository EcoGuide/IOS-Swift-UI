//
//  RadioButtonTest.swift
//  EcoGuide-Swift
//
//  Created by Copper_Orka on 9/11/2023.
//

import SwiftUI

struct RadioButtonTest: View {
    
    @State private var selectedButtonIndex: Int?
    var body: some View {
        VStack(spacing: 20) {
            RadioOptionButton(title: "Solo", index: 0, selectedButtonIndex: $selectedButtonIndex)
            RadioOptionButton(title: "Couple", index: 1, selectedButtonIndex: $selectedButtonIndex)
            RadioOptionButton(title: "Fam", index: 2, selectedButtonIndex: $selectedButtonIndex)
            RadioOptionButton(title: "Friends", index: 3, selectedButtonIndex: $selectedButtonIndex)
            RadioOptionButton(title: "Work", index: 4, selectedButtonIndex: $selectedButtonIndex)
        }
    }
}


struct RadioOptionButton: View {
    let title: String
    let index: Int
    @Binding var selectedButtonIndex: Int?

    var body: some View {
        Button(action: {
            selectedButtonIndex = index
        }) {
            HStack(alignment: .top){
                VStack(alignment: .leading, spacing: 0) {

                        Text(title)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .alignmentGuide(.leading, computeValue: { dimension in
                                dimension[.leading]
                            })
                    
                    Text("See all")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color.blue)
                        .buttonStyle(PlainButtonStyle())
                        .alignmentGuide(.leading, computeValue: { dimension in
                            dimension[.leading]
                        })
                }
                .overlay(
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(selectedButtonIndex == index ? Color.blue : Color.gray, lineWidth: 2)
                    }
                )
            }
        }
    }
}

struct RadioButtonTest_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonTest()
    }
}
