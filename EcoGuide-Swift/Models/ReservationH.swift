//
//  ReservationH.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 21/11/2023.
//

import Foundation

struct ReservationH : Codable {
    var _id: String
    var startDate: Date
    var nbdays: Int
    var totalPrice: Int
    var chambre: Chambre
    var userId: UserModel

}

struct FetchChambreReservationsResponse: Decodable {
    let reservations: [ReservationH]
    let message: String
    let statusCode: Int
}
