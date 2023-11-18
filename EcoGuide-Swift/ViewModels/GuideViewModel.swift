//
//  GuideViewModel.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 13/11/2023.
//

import Foundation
import SwiftUI

class GuideViewModel: ObservableObject {
    
    @Published var guides: [Guide] = []
    
    @Published var isLoading = true
    
    @Published var message: String = ""

    
    
    func fetchGuides() {
        Guideservice().fetchGuides(){ result in
            switch result {
                
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.guides = data?.guides ?? []
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
