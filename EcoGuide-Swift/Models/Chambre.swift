//
//  Chambre.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 18/11/2023.
//

import Foundation

struct Chambre : Codable{
    var _id: String
    var roomName: String
    var price: Int
    var nbPlace: Int
    var isBooked: Bool
    var nbChambreType: Int
    var image: String
}

struct fetchChambre: Decodable{
    let chambres : [Chambre]
       let message : String
       let statusCode : Int
}
