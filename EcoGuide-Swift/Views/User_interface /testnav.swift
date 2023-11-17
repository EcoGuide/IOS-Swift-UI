//
//  testnav.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-16.
//

import SwiftUI

struct testnav: View {
    @State private var isLinkActive = false
    @State private var isLoggingIn = false // Variable d'état pour contrôler la visibilité du ProgressView
    
    @State private var isLoading = false

      var body: some View {
          Button(action: {
              isLoading.toggle() // Activez ou désactivez la barre de progression lorsque le bouton est cliqué
          }) {
              if isLoading {
                  ProgressView()
                      .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                      .frame(width: 100, height: 100)
                      .scaleEffect(1.5) // Augmentez l'échelle
                      .padding(20) // Ajoutez un espacement autour du ProgressView
                      .foregroundColor(.red) // Changez la couleur
                      .opacity(0.8) // Réglez l'opacité
                      .animation(.easeInOut) // Personnalisez l'animation
              } else {
                  Text("Start Loading")
                      .foregroundColor(.white)
                      .padding()
                      .background(Color.blue)
                      .cornerRadius(20)
              }
          }
      }
  }


struct SecondView: View {
    var body: some View {
        Text("Seconde Vue")
            .navigationBarBackButtonHidden(true)
    }
}
struct testnav_Previews: PreviewProvider {
    static var previews: some View {
        testnav()
    }
}
