//
//  test.swift
//  EcoGuide-Swift
//
//  Created by Copper_Orka on 9/11/2023.
//

import SwiftUI

struct test: View {
    @State private var progress: Double = 0.2
    
    var body: some View {
        
        
            ZStack {
                ProgressBar(progress: $progress, color: .gray)
                    .frame(height: 15)
                ProgressBar(progress: $progress, color: .blue)
                  
                .frame(height: 15)
                .padding(.top, 0)
            }.padding(60)
    }
}

struct ProgressBar: View {
    @Binding var progress: Double
    var color: Color
    var stepPercentage: Double = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(color)
                    .frame(width: geometry.size.width * CGFloat(progress))
                    .cornerRadius(20)
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.2)
            }
        }
        .cornerRadius(20)
        .padding(.horizontal)
        
            }
        }
   



struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}


