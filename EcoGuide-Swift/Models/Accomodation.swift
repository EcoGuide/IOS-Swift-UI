//
//  Accomodation.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 15/11/2023.
//

import Foundation

struct Hotel: Codable{
    var _id : String
    var Nbchambre : Int
    var Nbetoile : Int
    var Localisation : String
    var Favoris : Bool
    var Rating : Double
    var imagename : String
    var price : Int
    var description : String
}

struct fetchHotelsResponse : Decodable{
    let hotels : [Hotel]
    let statusCode : Int    
    let message : String

}
