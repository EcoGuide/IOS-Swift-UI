//
//  ReservationGuide.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 19/11/2023.
//

import Foundation
struct ReservationGuide: Codable, Hashable {
    var _id: String // Add a unique identifier
    var guideId: String
    var userId: UserModel
    var hoursBooked: Int
    var location: String
}

struct FetchGuideReservationsResponse: Decodable {
    let reservations: [ReservationGuide]
    let message: String
    let statusCode: Int
}
