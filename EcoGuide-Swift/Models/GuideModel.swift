//
//  GuideModel.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 22/11/2023.
//

import Foundation

struct Guide: Codable, Hashable {
    var _id : String // Add a unique identifier
    var fullname: String
    var location: String
    var image: String
    var description: String
    var reviews: String
    var price: Int
    var discountCode:Int
}


//struct fetchGuideReviews : Codable {
//    let statusCode : Int
//    let message : String
//    let guide : Guide
//}


struct fetchGuidesResponse : Decodable {
    let guides : [Guide]
    let message : String
    let statusCode : Int
}
