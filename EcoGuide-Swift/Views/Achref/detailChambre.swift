//
//  detailChambre.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 22/11/2023.
//

import SwiftUI

struct detailChambre: View {
    var chambre: Chambre
    @Binding var discountcode: Double
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment:.leading,spacing: 20) {
                    AsyncImageView(url: chambre.image)
                    
                        .frame(height: 250)
                        .cornerRadius(32)
                    
                    
                    
                        .padding(.top, 15)
                }
            }
        }
    }
}
    struct detailChambre_Previews: PreviewProvider {
        
        @State private static var discountcode: Double = 0.0
        static var previews: some View {
            detailChambre(chambre: Chambre (_id: "test", roomName: "Modern", price:500, nbPlace: 5, isBooked:false,nbChambreType: 200, image: "home1"),discountcode: $discountcode)
        }
    }

