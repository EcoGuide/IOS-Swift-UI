//
//  GuideViewModel.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 13/11/2023.
//

import Foundation
import SwiftUI
import Alamofire

class GuideViewModel: ObservableObject {
    
    @Published var guides: [Guide] = []
    
    @Published var isLoading = true
    
    @Published var message: String = ""

    @Published var reservations: [ReservationGuide] = []
    
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
    
    
    func fetchGuideReservations(guideId: String) {
          Guideservice().fetchGuideReservations(guideId: guideId) { result in
              switch result {
              case .success(let data):
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                      if data?.statusCode == 200 {
                          self.isLoading = false
                          self.reservations = data?.reservations ?? []
                      }
                      self.message = data?.message ?? ""
                  }
                  
              case.failure(let error):
                  print(error.localizedDescription)
              }
          }
      }

      func addGuideReservation(guideId: String, userId: String, hoursBooked: Int, location: String) {
          Guideservice().addGuideReservation(guideId: guideId, userId: userId, hoursBooked: hoursBooked, location: location) { result in
              switch result {
              case .success(let data):
                  print("Reservation added successfully, \(data)")
              case .failure(let error):
                  print(error)
              }
          }
      }
}
