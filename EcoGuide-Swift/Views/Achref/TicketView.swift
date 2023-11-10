//
//  TicketView.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 9/11/2023.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        VStack {
            // Header
            HStack {
                Image(systemName: "arrow.left")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        // Add action to go back
                    }

                Spacer()

                Text("Ticket")
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()
            }
            .padding()
            
            .padding()

            // Ticket Frame
            VStack {
                Text("Intercontinental Hotel")
                    .font(.title)
                    .padding()

                Spacer()

                Image(systemName: "qrcode.viewfinder")
                    .font(.system(size: 100))
                    .padding()

                Spacer()

                Divider()
                    .background(Color.blue)
                    .padding()

                // Information
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Name")
                        Text("Kezia Williams")
                            .bold()
                        Text("Phone Number")
                        Text("+216 55 676 837")
                            .bold()
                        Text("Check-in")
                        Text("Dec 16 2023")
                            .bold()
                    }
                    .padding()

                    Spacer()

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Check-out")
                        Text("Dec 18, 2024")
                            .bold()
                        Text("Hotel")
                        Text("Intercontinental Hotel")
                            .bold()
                        Text("Guest 3")
                        Text("3")
                            .bold()
                    }
                    .padding()
                }

                // Download Button
                Button(action: {
                    // Add action to download ticket
                }) {
                    Text("Download Ticket")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
            .frame(width: 350, height: 570)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .padding()
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
