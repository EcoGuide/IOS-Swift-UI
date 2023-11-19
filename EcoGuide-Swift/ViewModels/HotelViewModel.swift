//
//  HotelViewModel.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 15/11/2023.
//

import Foundation
import SwiftUI

class HotelViewModel: ObservableObject{
    @Published var hotels:[Hotel] = []
    @Published var isLoading = true
    @Published var message: String = ""

    
    func fetchHotels(){
        HotelService().fetchHotels(){
            result in switch result {
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.hotels = data?.hotels ?? []
                    }
                    self.message = data?.message ?? ""
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchHotelss() {
        HotelService().fetchHotels { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.hotels = data?.hotels ?? []
                        
                        // Fetch chambres for each hotel
                        for index in 0..<self.hotels.count {
                            self.fetchChambresForHotel(at: index)
                        }
                    }
                    self.message = data?.message ?? ""
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func fetchChambresForHotel(at index: Int) {
        let hotelId = self.hotels[index]._id

        HotelService().fetchChambresForHotel(hotelId: hotelId) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if data.statusCode == 200 {
                        self.hotels[index].chambres += data.chambres
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
