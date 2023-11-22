//
//  Network.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 15/11/2023.
//

import Foundation
struct Network {
    static let BASE_URL = "http://localhost:3000/api"
    
    //guides routes
        static let fetchGuideUrl = BASE_URL + "/guides"
      
        // Guide reservations routes
        static func fetchGuideReservationsUrl(guideId: String) -> String {
            return "\(BASE_URL)/guides/\(guideId)/reservations"
        }
        
        static func addGuideReservationUrl(guideId: String) -> String {
            return "\(BASE_URL)/guides/\(guideId)/reservations"
        }
    
    //hotels routes
    static let fetchHotelsUrl = BASE_URL + "/hotels"
    
    static func fetchChambresForHotelUrl(hotelId: String) -> String {
            return BASE_URL + "/hotel/\(hotelId)"
        }
    // hotel reservations routes
        static func fetchChambreReservationsUrl(chambres: String) -> String {
            return "\(BASE_URL)/reservationH/\(chambres)"
        }
        
        static func addChambreReservationUrl(chambres: String) -> String {
            return "\(BASE_URL)/reservationH/\(chambres)/add"
        }
}
