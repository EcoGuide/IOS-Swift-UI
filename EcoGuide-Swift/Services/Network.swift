//
//  Network.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 15/11/2023.
//

import Foundation
struct Network {
    static let BASE_URL = "http://localhost:3000/api"
    
    
    
    
    //hotels routes
    static let fetchHotelsUrl = BASE_URL + "/hotels"
    
    static func fetchChambresForHotelUrl(hotelId: String) -> String {
            return BASE_URL + "/hotel/\(hotelId)"
        }
}
