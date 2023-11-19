//
//  Hotel.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 17/11/2023.
//

import Foundation

struct Hotel: Codable {
    var _id: String
    var hotelname: String
    var nbChambre: Int
    var nbStars: Int
    var location: String
    var Favoris: Int
    var rating: String
    var image: String
    var description: String
    var price: Int
    var chambres:[Chambre]
}

struct FetchHotelsResponse: Decodable {
    let hotels: [Hotel]
    let statusCode: Int
    let message: String
}
