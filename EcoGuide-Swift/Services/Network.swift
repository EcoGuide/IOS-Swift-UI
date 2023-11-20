//
//  Network.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 13/11/2023.
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
    
}

